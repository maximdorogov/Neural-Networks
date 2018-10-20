if __name__ == '__main__':

	def validate_quantity(n):

		USR_ERR_MSG = 'Error, wrong quantity'

		if n > 10 or n < 2:

			print(USR_ERR_MSG)
			quit()

		return

	def validate_XY(x,y):

		USR_ERR_MSG = 'Error, wrong values'

		if x > 10 or x < -10 or y > 10 or y < -10:

			print(USR_ERR_MSG)
			quit()

		return

	def get_quantity():

		return int(input())

	def main():

		first_read = True 

		n = get_quantity()

		validate_quantity(n)
		
		for n_itr in range(n):

		    xy = input().split()
		    x = int(xy[0])
		    y = int(xy[1])

		    validate_XY(x,y)

		    if first_read != True:

			    if (x - x_old != 0) and (y - y_old != 0):

			    	print('NO')
			    	quit()

		    first_read = False

		    x_old = x
		    y_old = y

		print('YES')   

	main() 