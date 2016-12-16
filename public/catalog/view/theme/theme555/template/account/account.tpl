<?php echo $header; ?>
<style>
h2 {
    border-left: solid 10px #f7b04a;
    padding: 10px;
}
.account-cubo {
  background: #f3f3f4;
  display: inline-block;
  padding: 45px 15px;
  margin: 15px;
  width: 250px;
  text-align: center;
  font-size: 18px;
}
.account-cubo:hover {
  color: #f3f3f4 !important;
  background: #2b2e39 !important;
}
.account-cubo:hover a {
  color: #f3f3f4 !important;
}

.account-cubo a {
  color: #2b2e39 !important;
}
.icongrande {
  font-size: 64px;
  margin-bottom: 15px;
}
a, a:visited {
    color: #131622;
    outline: none;
}
</style>

<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $text_my_account; ?></h2>

        <a href="<?php echo $edit; ?>"><div class="account-cubo">
          <i class="fa fa-users icongrande"></i><br>
          <?php echo $text_edit; ?></div></a>
        <a href="<?php echo $password; ?>"><div class="account-cubo">
          <i class="fa fa-unlock-alt icongrande"></i><br>
          <?php echo $text_password; ?></div></a>
        <a href="<?php echo $address; ?>"><div class="account-cubo">
          <i class="fa fa-map-marker icongrande"></i><br>
          <?php echo $text_address; ?></div></a>
        <a href="<?php echo $wishlist; ?>"><div class="account-cubo">
          <i class="fa fa-gift icongrande"></i><br>
          <?php echo $text_wishlist; ?></div></a>

      <h2 style="margin-top: 30px;"><?php echo $text_my_orders; ?></h2>

        <a href="<?php echo $order; ?>"><div class="account-cubo">
          <i class="fa fa-history icongrande"></i><br>
          <?php echo $text_order; ?></div></a>
        <a href="<?php echo $download; ?>"><div class="account-cubo">
          <i class="fa fa-download icongrande"></i><br>
          <?php echo $text_download; ?></div></a>
        <?php if ($reward) { ?>
        <a href="<?php echo $reward; ?>"><div class="account-cubo">
          <i class="fa fa-bookmark icongrande"></i><br>
          <?php echo $text_reward; ?></div></a>
        <?php } ?>
        <a href="<?php echo $return; ?>"><div class="account-cubo">
          <i class="fa fa-ban icongrande"></i><br>
          <?php echo $text_return; ?></div></a>
        <a href="<?php echo $transaction; ?>"><div class="account-cubo">
          <i class="fa fa-tasks icongrande"></i><br>
          <?php echo $text_transaction; ?></div></a>
        <a href="<?php echo $recurring; ?>"><div class="account-cubo">
          <i class="fa fa-circle-o-notch icongrande"></i><br>
          <?php echo $text_recurring; ?></div></a>

      <h2 style="margin-top: 30px;"><?php echo $text_my_newsletter; ?></h2>

        <a href="<?php echo $newsletter; ?>"><div class="account-cubo">
          <i class="fa fa-envelope icongrande"></i><br>
          <?php echo $text_newsletter; ?></div></a>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
