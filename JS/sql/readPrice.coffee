fs = require('fs');

readPrice = ( tabName, soucefileName, rltfileName)->
	chunks = []
	length = 0
	strRlt = ''
	rs = fs.createReadStream( """./#{soucefileName}.txt""" )
	rs.on 'data',( data, error )->
		chunks.push data
		length += data.length
	rs.on 'end',()->
		rlt = Buffer.concat( chunks, length )
		strRlt = rlt.toString()
		# console.log( strRlt )
		rlt = dealStr strRlt
		writeRlt rlt

	writeRlt = ( rlt )->
		resultBuffer = new Buffer(rlt)
		fs.writeFile("""./#{rltfileName}.sql""",resultBuffer,(err)->
				if err
					throw err
				console.log('has finished')
			)

	dealStr = ( str )->
		rltStr = []
		arrs = strRlt.split '\n'
		# console.log arrs.length
		comName = ''
		itemName = ''
		priceType = ''
		for prices in arrs
			# console.log prices
			cells = prices.split '\t'
			comName = cells[0] if cells[0] isnt 'NULL'
			itemName = cells[1] if cells[1] isnt 'NULL'
			priceType = cells[2] if cells[2] isnt 'NULL'
			for cell,idx in cells[3..cells.length]
				rltStr.push( """INSERT INTO #{tabName} VALUES('#{comName}','#{itemName}','#{priceType}','#{idx+1}',#{cell});""" ) if (cell.indexOf('NULL') is -1)
				# console.log( """INSERT INTO #{tabName} VALUES('#{comName}','#{itemName}','#{priceType}','#{idx+1}',#{cell})""" ) if cell isnt 'NULL'
			# console.log cells.length
		return ( rltStr.join '\n' )
	console.log 'done'

readPrice( 'COM_ITEM_PRICE','file1','price1' )
readPrice( 'COM_ITEM_PRICE','file2','price2' )
readPrice( 'COM_ITEM_PRICE','file3','price3' )