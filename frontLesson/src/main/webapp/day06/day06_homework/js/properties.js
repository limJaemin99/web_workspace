


function length() {
	let example = [];
	let inputText = document.getElementById("inputText").value;
	let inputs = inputText.split(",");
	example = example.concat(inputs);
	document.getElementById("result").textContent = example.length;
}