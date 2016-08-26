<?php
class ModelPaymentPayu extends Model {
	public function getMethod($address, $total) {
		$this->load->language('payment/payu');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('payu_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if ($this->config->get('payu_total') > 0 && $this->config->get('payu_total') > $total) {
			$status = false;
		} elseif (!$this->config->get('payu_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();

		if ($status) {
			$method_data = array(
				'code'       => 'payu',
				'title'      => $this->language->get('text_title'),
				'terms'      => '',
				'sort_order' => $this->config->get('payu_sort_order')
			);
		}

		return $method_data;
	}
	
	
	public function addTransaction($order_id,$transaction_data) {
		/**
		 * 1 to many relationship with paypal order table, many transactions per 1 order
		 */

		$this->db->query("INSERT INTO `" . DB_PREFIX . "payu_order_transaction` SET
			`order_id` = '" . (int)$order_id . "',
			`mihpayid` = '" . $transaction_data['mihpayid'] . "',
			`mode` = '" . $transaction_data['mode'] . "',
			`status` = '" . $transaction_data['status'] . "',
			`unmappedstatus` = '" . $transaction_data['unmappedstatus'] . "',
			`key` = '" . $transaction_data['key'] . "',
			`txnid` = '" . $transaction_data['txnid'] . "',
			`amount` = '" . $transaction_data['amount'] . "',
			`addedon` = '" . $transaction_data['addedon'] . "',
			`productinfo` = '" . $transaction_data['productinfo'] . "',
			`firstname` = '" . $transaction_data['firstname'] . "',
			`lastname` = '" . $transaction_data['lastname'] . "',
			`address1` = '" . $transaction_data['address1'] . "',
			`address2` = '" . $transaction_data['address2'] . "',
			`city` = '" . $transaction_data['city'] . "',
			`state` = '" . $transaction_data['state'] . "',
			`country` = '" . $transaction_data['country'] . "',
			`zipcode` = '" . $transaction_data['zipcode'] . "',
			`email` = '" . $transaction_data['email'] . "',
			`phone` = '" . $transaction_data['phone'] . "',
			`hash` = '" . $transaction_data['hash'] . "',
			`PG_TYPE` = '" . $transaction_data['PG_TYPE'] . "',
			`encryptedPaymentId` = '" . $transaction_data['encryptedPaymentId'] . "',
			`bank_ref_num` = '" . $transaction_data['bank_ref_num'] . "',
			`bankcode` = '" . $transaction_data['bankcode'] . "',
			`error` = '" . $transaction_data['error'] . "',
			`error_Message` = '" . $transaction_data['error_Message'] . "',
			`cardToken` = '" . $transaction_data['cardToken'] . "',
			`name_on_card` = '" . $transaction_data['name_on_card'] . "',
			`cardnum` = '" . $transaction_data['cardnum'] . "',
			`cardhash` = '" . $transaction_data['cardhash'] . "',
			`amount_split` = '" . $transaction_data['amount_split'] . "',
			`payuMoneyId` = '" . $transaction_data['payuMoneyId'] . "',
			`discount` = '" . $transaction_data['discount'] . "',
			`net_amount_debit` = '" . $transaction_data['net_amount_debit'] . "'");
			
	}
}