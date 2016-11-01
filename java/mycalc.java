//s ::= (s1)
//s1 ::= s2 * | / s2
//s2 ::== s3 + | - s3
//s3 ::= digit

// ( a - b ) * a * 100
eval( input ){
	
}

parse( input ){
	rlt;
	posi = 0;
	cha = getNextToken( input, posi )
	posi += cha.length
	rlt = parseInt( cha )
	cha = getNextToken( input, posi )
	if( !isNaN( cha ) ){
		rlt = parseInt( cha )
	}
}

getNextToken( input, posi ){
	i = posi;
	while(true){
		cha = input.substring( posi, i+1 )
		if( isNaN(cha) && i===posi )
			return cha
		else
			return input.substring( posi, i )
	}
}