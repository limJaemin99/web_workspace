/**
 * 
 */

 const calculate = () => {
	 //데이터 가져올 요소를 변수에 저장하기
	 const op1 = document.getElementById('operand1')
	 const op2 = document.getElementById('operand2')
	 const op = document.getElementById('operator')
	 let result	//계산 결과를 저장할 변수
	
	//Number() : 문자열을 number 타입으로 변환
		//▶ ex) NumbeR('12') = 12, Number('abc') = NaN(Not a Number) 리턴 
	/*
		value 또는 innerHTML 로 가져오는것은 문자열
		뺄셈, 곱셈, 나눗셈은 자동으로 데이터 캐스팅 후 연산
		덧셈은 캐스팅 직접 안하면 문자열 연결 연산
	*/
	 switch(op.value){
		case '+' :
			result = Number(op1.value) + Number(op2.value)	//Number 는 '+' 에만 사용하면 된다
			break									//▶ '+'는 '숫자+숫자' 와 '문자+문자' 둘 다 사용되기 때문
		case '-' :
			result = Number(op1.value) - Number(op2.value)
			break
		case '*' :
			result = Number(op1.value) * Number(op2.value)
			break
		case '/' :
			result = Number(op1.value) / Number(op2.value)
			break
		default :
			alert('알 수 없는 연산입니다.')
	 }
	 
	 document.getElementById('result').value = result
 }
 
 //executeBtn 버튼에 'click' 이벤트 작성하기
 	document.getElementById('executeBtn').addEventListener('click',calculate)
 	
 	