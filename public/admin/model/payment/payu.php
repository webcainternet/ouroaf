<?php
class ModelPaymentPayu extends Model {
	public function install() {
		

		$this->db->query("
			CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "payu_order_transaction` (
			  `payu_order_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
			  `order_id` int(11) NOT NULL,
			  `mihpayid` VARCHAR(255) DEFAULT NULL,
			  `mode` VARCHAR(255) DEFAULT NULL,
			  `status` VARCHAR(255) DEFAULT NULL,
			  `unmappedstatus` VARCHAR(255) DEFAULT NULL,
			  `key` VARCHAR(255) DEFAULT NULL,
			  `txnid` VARCHAR(255) DEFAULT NULL,
			  `amount` VARCHAR(255) DEFAULT NULL,
			  `addedon` VARCHAR(255) DEFAULT NULL,
			  `productinfo` TEXT DEFAULT NULL,
			  `firstname` VARCHAR(255) DEFAULT NULL,
			  `lastname` VARCHAR(255) DEFAULT NULL,
			  `address1` VARCHAR(255) DEFAULT NULL,
			  `address2` VARCHAR(255) DEFAULT NULL,
			  `city` VARCHAR(255) DEFAULT NULL,
			  `state` VARCHAR(255) DEFAULT NULL,
			  `country` VARCHAR(255) DEFAULT NULL,
			  `zipcode` VARCHAR(255) DEFAULT NULL,
			  `email` VARCHAR(255) DEFAULT NULL,
			  `phone` VARCHAR(255) DEFAULT NULL,
			  `hash` VARCHAR(255) DEFAULT NULL,
			  `PG_TYPE` VARCHAR(255) DEFAULT NULL,
			  `encryptedPaymentId` VARCHAR(255) DEFAULT NULL,
			  `bank_ref_num` VARCHAR(255) DEFAULT NULL,
			  `bankcode` VARCHAR(255) DEFAULT NULL,
			  `error` VARCHAR(255) DEFAULT NULL,
			  `error_Message` VARCHAR(255) DEFAULT NULL,
			  `cardToken` VARCHAR(255) DEFAULT NULL,
			  `name_on_card` VARCHAR(255) DEFAULT NULL,
			  `cardnum` VARCHAR(255) DEFAULT NULL,
			  `cardhash` TEXT DEFAULT NULL,
			  `amount_split` VARCHAR(255) DEFAULT NULL,
			  `payuMoneyId` VARCHAR(255) DEFAULT NULL,
			  `discount` VARCHAR(255) DEFAULT NULL,
			 `net_amount_debit` VARCHAR(255) DEFAULT NULL,
			  PRIMARY KEY (`payu_order_transaction_id`)
			) ENGINE=MyISAM DEFAULT COLLATE=utf8_general_ci;");
	}

	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "payu_order_transaction`;");
	}

	
}