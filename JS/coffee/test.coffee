foo = ->
	console.log '网易' for [1..10] by 2
foo [1,2,3]...

eat = ( food )->console.log( 'eatting ' + food ); return food
foods = ['broccoli', 'spinach', 'chocolate']
rlt = ( eat food for food in foods when food isnt 'chocolate' )
rlt = ( eat food for food in foods )

eat key,value for key,value of [x:1,y:2]
eat key,value for own key,value of [x:1,y:2]

console.log ['a','b','c'][0..1]
console.log ['a','b','c'][0...1]