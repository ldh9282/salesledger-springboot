const moneyUtils = {
	commaFormatting: function(input) {
		let numStr = typeof input === 'number' ? input.toString() : input;
		
		numStr = numStr.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
		return numStr;
	},
}

const phoneUtils = {
  	formatPhoneNumber: function(input) {
    	let numStr = input.replace(/\D/g, '');

    	// Add dashes to the phone number
    	numStr = numStr.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');

    	return numStr;
  },
};