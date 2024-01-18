<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<<script>


function doSubmit() {
	let frm = document.joinform;



	let flag = true;
	let accountArray = [idCheck(), pwCheck(), nameCheck(), telCheck()]

	for (let i = 0; i < accountArray.length; i++) {
		if (!accountArray[i]) {
			flag = false;
		}
	}

	if (flag) {
		let check = "회원가입 정보가 다음과 같은지 확인하세요!\n\n"
			+ "이름: " + frm.name.value + "\n"
			+ "아이디: " + frm.username.value + "\n"
			+ "전화번호: " + frm.tel.value + "\n"
			+ "생년월일: " + frm.date_uer.value + "\n"
			+ "주소: " + frm.sample6_postcode.value + " 우편번호 " + frm.sample6_address.value + frm.sample6_detailAddress.value + frm.sample6_extraAddress.value + "\n"

		if (confirm("" + check)) {
			frm.submit();
		}
	}else{
		alert("password 꼭 써주세요");
	}
}



function idCheck() {
	let frm = document.joinform;
	if (frm.username.value) {
		let regName = /^[a-zA-Z0-9-_]{5,13}$/;
		if (!regName.test(frm.username.value)) {
			alert("아이디 : 5~13자리 영,숫자,특수문자( _ )만 입력");
			return false;
		} else {
			return true;
		}
	}
}


function pwCheck() {
	let frm = document.joinform;
	if (frm.password.value) {
		let regName = /^[a-zA-Z0-9-_/,.]{5,13}$/;
		if (!regName.test(frm.password.value)) {
			alert("비밀번호 : 5~13자리 영문,숫자, 특수문자만 가능");
			return false;
		} else {
			return true;
		}
	}
}



function nameCheck() {
	let frm = document.joinform;

	if (frm.name.value) {
		let regName = /^[a-zA-Zㄱ-힣]{2,13}$/;
		if (!regName.test(frm.name.value)) {
			alert("이름 : 2~13자리 한,영문만 가능");
			return false;
		} else {
			return true;
		}
	}
}

function telCheck() {
	let frm = document.joinform;
	if (frm.tel.value) {
		let regName = /^[0-9]{11}$/;
		if (!regName.test(frm.tel.value)) {
			alert("전화번호 11자리 기입해주세요.");
			return false;
		} else {
			return true;
		}
	}
}

/*function bankNum() {
	let frm = document.joinform;
	if (frm.bank_num.value) {
		let regName = /^[0-9]{1,14}$/;
		if (!regName.test(frm.bank_num.value)) {
			alert("계좌 14자리 이하로 적으세요");
			return false;
		} else {
			return true;
		}
	}
}

function user_holder() {
	let frm = document.joinform;
	if (frm.holder.value) {
		let regName = /^[a-zA-Zㄱ-힣]{1,10}$/;
		if (!regName.test(frm.holder.value)) {
			alert("예금주 이름을 적으세요. 10 자리 이하");
			return false;
		} else {
			return true;
		}
	}
}*/


//**************** 주소 자바스크립*********************
//=====================================================

function sample6_execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {

			let addr = '';
			let extraAddr = '';
			if (data.userSelectedType === 'R') {
				addr = data.roadAddress;
			} else {
				addr = data.jibunAddress;
			}
			if (data.userSelectedType === 'R') {
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				document.getElementById("sample6_extraAddress").value = extraAddr;

			} else {
				document.getElementById("sample6_extraAddress").value = '';
			}

			document.getElementById('sample6_postcode').value = data.zonecode; document.getElementById("sample6_address").value = addr;
			document.getElementById("sample6_detailAddress").focus();
		}
	}).open();
}
</script>