var Show = (function(){
  var $btnNewTransaction;
  var $modalTransaction;
  var $btnSave;
  var $amount;
  var $tType;
  var $parameters;
  var $notification;

  var bank_account_id;
  var url = "/api/v1/bank_accounts/new_transaction";

  var disableBtns = function() {
    $btnSave.prop("disabled", true);
    $amount.prop("disabled", true);
    $tType.prop("disabled", true);
  };

  var enableBtns = function() {
    $btnSave.prop("disabled", false);
    $amount.prop("disabled", false);
    $tType.prop("disabled", false);
  };

  var fetch = function(){
    $btnNewTransaction = $("#btn-transaction");
    $modalTransaction  = $("#modal-transaction");
    $btnSave           = $("#btn-save");
    $amount            = $("#amount");
    $tType             = $("#t-type");
    $parameters        = $("#parameters");
    $notification      = $(".notification");
    bank_account_id         = $parameters.data("bank-account-id");
  };

  var events = function(){
    $btnNewTransaction.on("click", function(){
      $modalTransaction.modal("show");
    }); 

    $btnSave.on("click", function(){
      var amount = $amount.val();
      var tType  = $tType.val();
      disableBtns();
     
      $notification.html("");

      $.ajax({
        url: url,
	method: 'POST',
	dataType: 'json',
	data: {
	  amount: amount,
	  transaction_type: tType,
	  bank_account_id: bank_account_id
	},
	success: function(response) {
	  window.location.href = "/bank_accounts/" + bank_account_id
	},
	error: function(response){
	  $notification.html(JSON.parse(response.responseText).errors.join());
	  enableBtns();
	}
      });
    });
  };

  var init = function() {
    fetch();
    events();
  };
  
  return {
    init: init
  };
})();
