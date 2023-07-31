



function push() {
	let example = []
	let inputText1 = document.getElementById("inputText1").value;
	let inputText2 = document.getElementById("inputText2").value;
	let inputs = inputText1.split(",");
	example = example.concat(inputs);
	example.push(inputText2)
	document.getElementById("result1").textContent = example.toString()
}


function pop(){
	let example = []
	let inputText = document.getElementById("inputText3").value;
	let inputs = inputText.split(",");
	example = example.concat(inputs);
	document.getElementById("result2").textContent = '추출 : '+example.pop()+' 배열 : '+example.toString()
}


function unshift(){
	let example = []
	let inputText1 = document.getElementById("inputText4").value;
	let inputText2 = document.getElementById("inputText5").value;
	let inputs = inputText1.split(",");
	example = example.concat(inputs);
	example.unshift(inputText2)
	document.getElementById("result3").textContent = example.toString()
}


function shift(){
	let example = []
	let inputText = document.getElementById("inputText6").value;
	let inputs = inputText.split(",");
	example = example.concat(inputs);
	document.getElementById("result4").textContent = '추출 : '+example.shift()+' 배열 : '+example.toString()
}


function sort(){
	let example = []
	let inputText = document.getElementById("inputText7").value;
	let inputs = inputText.split(",");
	example = example.concat(inputs);
	example.sort()
	document.getElementById("result5").textContent = example.toString()
}


function reverse(){
	let example = []
	let inputText = document.getElementById("inputText8").value;
	let inputs = inputText.split(",");
	example = example.concat(inputs);
	example.reverse()
	document.getElementById("result6").textContent = example.toString()
}