
def process(data):
	output = {}
	output["tweet_length_with_spaces"] = len(data.text)
	output["tweet_length_no_spaces"] = len(data.text.replace(" ", ""))
	return output