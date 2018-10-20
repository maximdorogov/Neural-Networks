if __name__ == '__main__':

	def validate_quantity(n):

		USR_ERR_MSG = 'Error, wrong quantity'

		if n > 50 or n <= 0:

			print(USR_ERR_MSG)
			quit()

		return

	def get_quantity():

		return int(input())

	def validate_string(string,strlen):

			USR_QTY_ERR_MSG = 'Error, wrong quantity'
			USR_CHAR_ERR_MSG = 'Error, wrong character'

			if len(string) != strlen:

				print(USR_ERR_MSG)
				quit()

			for n_itr in range(strlen):

				if string[n_itr] != 'R' and string[n_itr] != 'G' and string[n_itr] != 'B':

					print(USR_CHAR_ERR_MSG)
					quit()
			return

	def main():

		ctr = 0

		n = get_quantity()

		validate_quantity(n)

		string = input()

		validate_string(string,n)

		for n_itr in range(n):

			if n_itr != n-1:

				if string[n_itr] == string[n_itr+1]:

					ctr = ctr + 1

		print(ctr)		

	main()