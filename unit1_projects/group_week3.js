var sum= function(arr) {
	var total= 0;
	for(var i=0; i < arr.length; i++) {
		total+= arr[i];
	}
	return total;
}

var mean= function(arr) {
	var arraySum= sum(arr);
	return (arraySum/arr.length);
}

var median= function(arr) {
	var sortedArray= arr.sort;
	if (sortedArray%2==0) {
		return (arr[arr.length/2] + arr[(arr.length+2)/2])/2;
	}
	else	
		return arr[(arr.length+1)/2];
}

sum([2,3,4]);
mean([1,2,3])
median([1,2,3])
