
<?php 
// Merchant key here as provided by Payu
$MERCHANT_KEY = $merchant;

// Merchant Salt as provided by Payu
$SALT = $salt;

// End point - change to https://secure.payu.in for LIVE mode
$PAYU_BASE_URL = $url;

$action = '';

$return_url = $returnurl;
$return_error_url = $cancelurl;
$formError = 0;

$txnid = substr(hash('sha256', mt_rand() . microtime()), 0, 20);
$hash = '';
// Hash Sequence
$hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
$hashSequence = $MERCHANT_KEY.'|'.$txnid.'|'.$amount.'|'.$productinfo.'|'.$firstname.'|'.$email.'|||||||||||'.$SALT; 

	

    $hash = strtolower(hash('sha512', $hashSequence));
	
    $action = $PAYU_BASE_URL . '/_payment';
  

?>

 <form action="<?php echo $action; ?>" method="post" name="payuForm", id="payuFormSubmit">
     <input type="hidden" name="key" value="<?php echo $MERCHANT_KEY ?>" />
     <input type="hidden" name="hash" value="<?php echo $hash ?>"/>
     <input type="hidden" name="txnid" value="<?php echo $txnid ?>" />
     <input type="hidden" name="amount" value="<?php echo $amount ?>" />
     <input type="hidden" name="firstname" value="<?php echo $firstname ?>" />
     <input type="hidden" name="email" value="<?php echo $email ?>" />
     <input type="hidden" name="phone" value="<?php echo $mobile ?>" />
     <input type="hidden" name="productinfo" value="<?php echo $productinfo ?>" />
     <input type="hidden" name="surl" value="<?php echo $return_url ?>" />
     <input type="hidden" name="furl" value="<?php echo $return_error_url ?>" />
     <input type="hidden" name="service_provider" value="payu_paisa" size="64" />
     <input type="hidden" name="lastname" value="<?php echo $lastname ?>" />
     <input type="hidden" name="curl" value="" />
     <input type="hidden" name="address1" value="" />
     <input type="hidden" name="address2" value="" />
     <input type="hidden" name="city" value="" />
     <input type="hidden" name="state" value="" />
     <input type="hidden" name="country" value="" />
     <input type="hidden" name="lastname" value="" />
     <input type="hidden" name="zipcode" value="" />
     <input type="hidden" name="udf1" value="" />
     <input type="hidden" name="udf2" value="" />
     <input type="hidden" name="udf3" value="" />
     <input type="hidden" name="udf4" value="" />
     <input type="hidden" name="udf" value="" />
     <input type="hidden" name="pg" value="" />
      <div class="buttons">
        <div class="pull-right">
          <input type="submit" value="<?php echo $button_confirm; ?>" class="btn btn-primary" />
        </div>
      </div>
</form>
