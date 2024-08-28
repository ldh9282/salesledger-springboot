const moneyUtils = {
	commaFormatting: function(input) {
	    // Ensure parameter is converted to number
	    let numberValue = Number(input);
	    
        if (isNaN(numberValue) || !isFinite(numberValue)) {
        	return '-';
    	}
	    let numStr = '';
	    // Check if the value is an integer
	    if (Number.isInteger(numberValue)) {
			numStr = Number.parseInt(numberValue).toString();
		} else if ((numberValue.toFixed(1) == numberValue) || (numberValue.toFixed(2) == numberValue) || (numberValue.toFixed(3) == numberValue)) {
	    	// Check if the value is an integer or a float up to 3 decimal place
	        numStr = numberValue.toString();
	    } else {
	        numStr = numberValue.toFixed(3);
	        
	        if (Number.isInteger(Number(numStr))) {
				numStr = Number.parseInt(Number(numStr)).toString()
			}
	    }
		
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

const dateUtils = {
  	formatYYYYMMDD: function(input, separator) {
	    if (!input) {
	        return null;
	    }
	    
	    let date = new Date(input);
	    let formattedDate = date.getFullYear() + separator + String(Number(date.getMonth() + 1)).padStart(2, '0') + separator + String(date.getDate()).padStart(2, '0');
	    
	    return formattedDate;
  	},
  	getDate: function(input) {
	    let regex = /^\d{4}-\d{2}-\d{2}$/;
	    if (!regex.test(input)) {
	        return null;
	    }
		return new Date(input);
	}
};

const floatUtils = {
	formatRatio: function(input) {
	    // Ensure parameter is converted to number
	    let numberValue = Number(input);
	    
        if (isNaN(numberValue) || !isFinite(numberValue)) {
        	return '-';
    	}
	    // Check if the value is an integer
	    if (Number.isInteger(numberValue)) {
			return Number.parseInt(numberValue);
		} else if ((numberValue.toFixed(1) == numberValue) || (numberValue.toFixed(2) == numberValue) || (numberValue.toFixed(3) == numberValue)) {
			// Check if the value is a float up to 3 decimal place
	        return numberValue;
	    } else {
	        let result = numberValue.toFixed(3);
	        
	        if (Number.isInteger(Number(result))) {
				result = Number.parseInt(Number(result)).toString()
			}
	        return Number(result);
	    }
	}
}