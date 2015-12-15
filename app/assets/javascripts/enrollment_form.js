var handleValidation = function(validator, control) {
  var valid = validator(control);

  if(!valid) {
    control.addClass("invalid-field");
  } else {
    control.removeClass("invalid-field");
  }

}

var validatePresence = function(control) {
  return control.val().length > 0;
}

var validateEmail = function(control) {
  return (/.*\@.*\..*/).test(control.val());
}

var validate = function(control, options) {
  if(options['presence']) {
    handleValidation(validatePresence, control);
  }

  if (options['email']) {
    handleValidation(validateEmail, control);
  }
}

var handleSubmitBtn = function() {
  var valid = $("form input.invalid_field").length == 0 &&
              $("form input.unfilled_field").length == 0;
  $("form button").prop("disabled", !valid);
}

$(document).ready(function() {
  $("form input").on("blur", function() {
    if ($(this).val().length > 0) {
      $(this).removeClass("unfilled_field");
    } else {
      $(this).addClass("unfilled_field");
    }
    handleSubmitBtn();
  });

  $("form input[type=checkbox]").on("change", function() {
    if ($(this).is(':checked')) {
      $(this).removeClass("unfilled_field");
    } else {
      $(this).addClass("unfilled_field");
    }
    handleSubmitBtn();
  });


  $("#enrollment_name, #enrollment_email").on("keyup blur", function() {
    validate($(this), { presence: true });
  });

  $("#enrollment_email").on("keyup blur", function() {
    validate($(this), { email: true });
  });
});
