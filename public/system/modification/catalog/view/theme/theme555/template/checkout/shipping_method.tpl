<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($shipping_methods) { ?>
<p><?php echo $text_shipping_method; ?></p>
<?php foreach ($shipping_methods as $shipping_method) { ?>
<p><strong><?php echo $shipping_method['title']; ?></strong></p>
<?php if (!$shipping_method['error']) { ?>
<?php foreach ($shipping_method['quote'] as $quote) { ?>
<div class="radio">
  <label>
    <?php if ($quote['code'] == $code || !$code) { ?>
    <?php $code = $quote['code']; ?>
    <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" />
    <?php } ?>
    <?php echo $quote['title']; ?> - <?php echo $quote['text']; ?></label>
</div>
<?php } ?>
<?php } else { ?>
<div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
<?php } ?>
<?php } ?>
<?php } ?>
<p><strong><?php echo $text_comments; ?></strong></p>
<p>
  <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
</p>

     <div class="cart-module">
      <div class="cart-heading"><?php echo $coupon_heading_title; ?></div>
      <div class="cart-content">
      <label class="col-sm-2 control-label" for="input-coupon"><?php echo $entry_coupon; ?></label>
      <div>
      <input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="<?php echo $entry_coupon; ?>" id="input-coupon" class="form-control" />
      <span>
      <input type="button" value="<?php echo $button_coupon; ?>" id="button-coupon" data-loading-text="<?php echo $text_loading; ?>"  class="btn btn-primary" />
      </span></div>
      <div id="notifcation"></div>
    </div>
    </div>
<script>
$('#button-coupon').on('click', function() {
  $.ajax({
    type: 'POST',
    url: 'index.php?route=checkout/shipping_method/validateCoupon',
     data: $('input[name="coupon"]'),
    dataType: 'json',   
    beforeSend: function() {
      $('.coupon-alert').remove();
      $('#button-coupon').attr('disabled', true);
    },
    complete: function() {
      $('#button-coupon').attr('disabled', false);
    },    
    success: function(json) {
      $('.coupon-alert').remove();
     
      if (json['error']) {
        $('.cart-heading').before('<div class="coupon-alert alert alert-warning">' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
      }
      
      if (json['success']) {
        
         $('.cart-heading').before('<div class="coupon-alert alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
          
        setTimeout(function () {
          $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
        }, 100);

        $('#cart > ul').load('index.php?route=common/cart/info ul li');
      }
    }
  });
});
</script>
      
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>
