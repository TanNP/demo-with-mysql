module ExcerciseHelper
	def getNum(number)
		numArray = Array.new
		numArray = number.split(' ')
		numArray2 =Array.new
		for i in 0..numArray.size-1
			numArray2=numArray2<<numArray[i].to_i
		end
		return numArray2.sort
	end

	def getShortestString(line)
		lineArray = Array.new
		lineArray = line.split(' ')
		return lineArray.max_by { |x| -x.length }
	end
end
