<?php
class ControllerPaymentPayu extends Controller {
	public function index() {
		$data['button_confirm'] = $this->language->get('button_confirm');

		$this->load->model('checkout/order');

		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		if($this->config->get('payu_test')=='1'){
			$data['url'] = 'https://test.payu.in';
		}else{
			$data['url'] = 'https://secure.payu.in';
		}
		
		$data['merchant'] = $this->config->get('payu_merchant');
		$data['salt'] = $this->config->get('payu_security');
		$data['amount'] = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
		$data['firstname'] = $order_info['firstname'];
		$data['lastname'] = $order_info['lastname'];
		$data['email'] = $order_info['email'];
		$data['mobile'] = $order_info['telephone'];
		$data['productinfo'] = $this->config->get('config_name') . ' - #' . $this->session->data['order_id'];
		$data['returnurl'] = $this->url->link('payment/payu/payureturn');
		$data['cancelurl'] = $this->url->link('checkout/cart', '', 'SSL');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/payu.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/payment/payu.tpl', $data);
		} else {
			return $this->load->view('default/template/payment/payu.tpl', $data);
		}
	}


	public function payureturn() {
		/**
		 * This is the url when PayPal has completed the auth.
		 *
		 * It has no output, instead it sets the data and locates to checkout
		 */
		$this->load->model('payment/payu');
		$this->load->model('checkout/order');
		$explodeID = explode('#',$this->request->post['productinfo']);
		
		$this->model_checkout_order->addOrderHistory($explodeID[1], '1');
		$this->model_payment_payu->addTransaction($explodeID[1], $this->request->post);
		$this->response->redirect($this->url->link('checkout/success')); 
		
		
	}

	
}