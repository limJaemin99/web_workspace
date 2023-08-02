


//자바스크립트 오브젝트의 배열
const schedules = [{time:'09:00',todo:'수업'},
					{time:'11:00',todo:'과제'},
					{time:'12:30',todo:'점심식사'},
					{time:'14:00',todo:'주간회의'},
					{time:'16:45',todo:'자료조사'}]

//schedules 자바스크립트 객체를 네트워크를 통해 전송하기 위해 문자열로 변환하는 메소드
	//js 객체(Object) ▶ String
const str = JSON.stringify(schedules)
document.write(str)
document.write('<br>')
console.log(typeof str)			//String
console.log(typeof schedules)	//Object

//데이터를 받은 쪽에서는 문자열로 받은것을 str 자바스크립트 객체로 변환하는 메소드
const receive = JSON.parse(str)
document.write(receive)			//━ 객체.toString() 출력은 데이터 확인 불가 ━
document.write('<br>')			
console.log(typeof receive)		//Object
console.log(receive)			//━ 콘솔에서는 객체 정보를 모두 보여줌 ━
