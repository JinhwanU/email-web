let isNull = function(obj, msg) {
	if (obj.value == '') {
		alert(msg)
		obj.focus()
		return true
	}
	return false
}

let isNotEqual = function(password, passwordCheck, msg) {
		if (password.value != passwordCheck.value) {
			alert(msg)
			password.focus()
			return true
		}
		return false
	}