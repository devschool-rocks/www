$(document).ready(function() {
  $('form#free_gift').formValidation({
    framework: 'bootstrap',
    icon: {
      valid: 'glyphicon glyphicon-ok',
      invalid: 'glyphicon glyphicon-remove',
      validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
      name: {
	row: '.col-xs-4',
	validators: {
	  notEmpty: {
	    message: 'Your name is required'
	  }
	}
      },
      email: {
	validators: {
	  notEmpty: {
	    message: 'Your email address is required'
	  },
	  emailAddress: {
	    message: 'The input is not a valid email address'
	  }
	}
      },
      message: {
	validators: {
	  notEmpty: {
	    message: 'The message is required'
	  },
	  stringLength: {
	    max: 700,
	    message: 'The message must be less than 700 characters long'
	  }
	}
      }
    }
  })
});
