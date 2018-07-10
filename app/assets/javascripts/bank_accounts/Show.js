var Show = (function(){
  var $btnNewTransaction;
  var $modalTransaction;
  var $btnSave;
  var $amount;
  var $tType;
  var $parameters;
  
  var account_id;

  var disableBtns = function() {
    $btnSave.prop("disabled", true);
    $amount.prop("disabled", true);
    $tType.prop("disabled", true);
  };

  var enableBtns = function() {
    $btnSave.prop("disabled", false);
    $amount.prop("disabled", false);
    $ttransaction.prop("disabled", false);
  };

  var fetch = function(){
    $btnNewTransaction = $("#btn-transaction");
    $modalTransaction  = $("#modal-transaction");
    $btnSave           = $("#btn-save");
    $amount            = $("#amount");
    $tType             = $("#t-type");
    $parameters        = $("#parameters");

    account_id         = $parameters.data("bank-account-id");
  };

  var events = function(){
    $btnNewTransaction.on("click", function(){
      $modalTransaction.modal("show");
    }); 

    $btnSave.on("click", function(){
      var amount = $amount.val();
      var tType  = $tType.val();
      disableBtns();
      console.log("Amount: " + amount + "Type: " + tType + "Account Id: " + account_id);
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
