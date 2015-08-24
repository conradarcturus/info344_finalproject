import tweepy

auth = tweepy.OAuthHandler('dTsqcwupglcrL6VDlVs8vqb5Z', 'Jfcgrnx9JrSwzCXESFh1h6XN2H65BWZ5xsD1zAWnKBwew39Nan')
auth.set_access_token('92222507-zrIXK228k875XRg6xenj9HjMNswICSIDnY8toVVWS', 'coAJ8nDnH6a3FOuhu7FkKWzrv6JceGHwwtMnh2Ela90QK')

api = tweepy.API(auth)

def testing_tweets():
	public_tweets = api.home_timeline()
	for tweet in public_tweets:
		return tweet.text

def verify_tweets(tweets):
	verified_tweets = []
	for tweet in tweets:
		success = True
		status = {}
		try:
			status = api.get_status(tweet['id'])
		except:
			success = False
		if status is None:
			success = False
		tweet['found'] = success
		verified_tweets.append(tweet)
	return verified_tweets