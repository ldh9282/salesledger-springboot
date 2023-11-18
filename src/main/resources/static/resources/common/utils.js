const moneyUtils = {
	commaFormatting: function(input) {
		let numStr = typeof input === 'number' ? input.toString() : input;
		
		numStr = numStr.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
		 return numStr;
	},
}