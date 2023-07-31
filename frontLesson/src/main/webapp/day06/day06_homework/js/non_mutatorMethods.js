


function forEach() {
  let example = [];
  let inputText = document.getElementById("inputText1").value;
  let inputs = inputText.split(",");
  example = example.concat(inputs);

  let resultString = "";
  example.forEach(function (element) {
    resultString += element + " ";
  });

  document.getElementById("result1").textContent = resultString;
}


function filter() {
  let inputText = document.getElementById("inputText2").value;
  let inputArray = inputText.split(",").map(Number);

  let filteredArray = inputArray.filter(function (element) {
    return element % 2 === 0;
  });

  let resultString = filteredArray.join(" ");

  document.getElementById("result2").textContent = resultString;
}


function find() {
  let inputText = document.getElementById("inputText3").value;
  let inputArray = inputText.split(",").map(Number);

  let foundValue = inputArray.find(function (element) {
    return element % 2 === 0;
  });

  document.getElementById("result3").textContent = foundValue;
}


function findIndex() {
  let inputText = document.getElementById("inputText4").value;
  let inputArray = inputText.split(",").map(Number); // 띄어쓰기로 구분하여 숫자 배열로 변환

  // findIndex() 메소드를 사용하여 주어진 배열에서 짝수를 필터링하여 첫 번째 인덱스 숫자 찾기
  let foundIndex = inputArray.findIndex(function (element) {
    return element % 2 === 0;
  });

  // 결과를 result4 엘리먼트에 표시
  document.getElementById("result4").textContent = foundIndex;
}


function includes(){
	let example = []
	let inputText1 = document.getElementById("inputText5").value;
	let inputText2 = document.getElementById("inputText6").value;
	let inputs = inputText1.split(",");
	example = example.concat(inputs);
	document.getElementById("result5").textContent = example.includes(inputText2)
}


function join(){
	let example = []
	let inputText1 = document.getElementById("inputText7").value;
	let inputs = inputText1.split(",");
	example = example.concat(inputs);
	example.join("★")
	document.getElementById("result6").textContent = example.toString()
}


function join() {
  let inputText1 = document.getElementById("inputText7").value;
  let inputText2 = document.getElementById("inputText8").value;

  let inputArray = inputText1.split(",");

  let result = inputArray.join(inputText2);

  document.getElementById("result6").textContent = result;
}
