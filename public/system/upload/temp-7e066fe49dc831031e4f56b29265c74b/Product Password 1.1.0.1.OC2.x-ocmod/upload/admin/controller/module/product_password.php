<?php
#############################################################################
   #
#############################################################################
class ControllerModuleProductPassword extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/product_password');

		$this->document->setTitle( $this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('product_password', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect((HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token']));
		}
		
	global $db;
		$db->query("CREATE  TABLE IF NOT EXISTS `" . DB_PREFIX . "product_password` ( 
  				`product_password_id` int(11) NOT NULL auto_increment, 
  				`product_id` int( 11  )  NOT  NULL default  '0',
 				`password` text  NULL ,
 				PRIMARY KEY  (`product_password_id`)
 	)");
	
	
		$data['heading_title'] = $this->language->get('heading_title');
		$data['enable_product_password'] = $this->language->get('enable_product_password');

  	
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning']))
		{
			$data['error_warning'] = $this->error['warning'];
		}
		else
		{
			$data['error_warning'] = '';
		}
		if (isset($this->error['error_sort_order']))
		{
			$data['error_sort_order'] = $this->error['error_sort_order'];
		}
		else
		{
			$data['error_sort_order'] = '';
		}
		if (isset($this->error['error_limit']))
		{
			$data['error_limit'] = $this->error['error_limit'];
		}
		else
		{
			$data['error_limit'] = '';
		}

  		$this->document->breadcrumbs = array();

   		$this->document->breadcrumbs[] = array(
       		'href'      => (HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token']),
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->document->breadcrumbs[] = array(
       		'href'      => (HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token']),
       		'text'      => $this->language->get('text_module'),
      		'separator' => ' :: '
   		);

   		$this->document->breadcrumbs[] = array(
       		'href'      => (HTTPS_SERVER . 'index.php?route=module/product_password&token=' . $this->session->data['token']),
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);

		$data['action'] = (HTTPS_SERVER . 'index.php?route=module/product_password&token=' . $this->session->data['token']);

		$data['cancel'] = (HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token']);

		if (isset($this->request->post['product_password'])) {
			$data['product_password'] = $this->request->post['product_password'];
		} else {
			$data['product_password'] = $this->config->get('product_password');
		}
		$this->id       = 'product_password';
		$this->template = 'module/product_password.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
			$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $data['heading_title'] ,
			'href' => $this->url->link('module/product_password', 'token=' . $this->session->data['token'], 'SSL')
		);
		$data['text_edit'] = $this->language->get('text_edit');
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view($this->template, $data));

	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/product_password')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
	
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}
}
?>