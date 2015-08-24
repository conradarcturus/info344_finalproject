import csv
import re
from feature_scripts import *
#import feature_scripts
from shine.models import AnnotatedFile
#from feature_scripts import TweetLengthExtractor
import os
from django.core.files.storage import default_storage
import codecs

def list_files(startpath):
	out = ""
	for root, dirs, files in os.walk(startpath):
		level = root.replace(startpath, '').count(os.sep)
		indent = ' ' * 4 * (level)
		out += indent + os.path.basename(root) + "\n"
		subindent = ' ' * 4 * (level + 1)
		for f in files:
			out += subindent + f + '\n'
	return out


def readTweets(filename):
	tweet_list = []
	try:
		with default_storage.open("/project" + filename, 'r') as csvfile:
			reader = UnicodeDictReader(csvfile)

			for idx, row in enumerate(reader):
				if idx > 10:
					break
				if 'id_str' not in row:
					row['id_str'] = '0'
				if 'text' not in row:
					row['text'] = 'no text'
				if 'user.screen_name' not in row:
					row['user.screen_name'] = 'AConradNied'
				tweet_list.append({'text': row['text'], 'id': row['id_str'], 'user': row['user.screen_name']})
		csvfile.close()
	except FileNotFoundError:
		tweet_list.append({'text': "FileNotFoundError", 'user': '', 'id': '1'})
	except UnicodeDecodeError:
		tweet_list.append({'text': "UnicodeDecodeError", 'user': '', 'id': '1'})
	# except:
	# 	tweet_list.append({'text': "Unknown", 'user': '', 'id': '1'})
	return tweet_list

def UnicodeDictReader(utf8_data, **kwargs):
    csv_reader = csv.DictReader(utf8_data, **kwargs)
    for row in csv_reader:
    	# yield [unicode(cell, 'utf-8') for cell in row]
       # yield {key: codecs.decode(value, "utf-8", "ignore").encode('ascii') for key, value in row.items()}
       # yield {key: value.encode('utf-8') for key, value in row.items()}
       yield {key: value for key, value in row.items()}

def removeNonAlphaNum(strng):
	return re.sub(re.compile('\W'), '', strng)

def executeFeatureScript(inputFile, featureScript):
    return list_files(".")
#        script = getattr(feature_scripts, featureScript.name)
#        script = getattr(feature_scripts)
#        return str(__dir__(feature_scripts))
#        return feature_scripts['featureScript.name']
#        TweetLengthExtractor.process()
#        feature_scripts.process("")
#        script = ___import__('feature_scripts.' + featureScript.name)
#        return ""

if 0: '''
#	script = getattr(__import__('feature_scripts'), featureScript.name)
	# script = importlib.import_module('feature_scripts.' + featureScript.name)

	filename = inputFile.data_csv.url
	annotations = []
	with open(filename, encoding="utf-8", errors='ignore') as csvfile:
		reader = csv.DictReader(csvfile)

		for idx, row in enumerate(reader):
			output = {"text": row['text']}		
			# data.text = row['text']

			data = Object();
			for key in row.keys():
				setattr(data, removeNonAlphaNum(key), row[key])

				output = {}
				exec(featureScript.script)
				annotations.append(output)
		return ""
if 0: 
				# data.(key) = row[key]

			# data = namedtuple('Struct', row.keys())(*row.values())

			# for line in featureScript.script.splitlines():
						# output['test'] = line
						# exec(compile(line), '<string>', 'exec')
						output = {}
						exec featureScript.script
			#output = script.process(data);

			annotations.append(output)
		return ""

		# Write new file
		filename = 'data_annotated/' + 
		csv_writer = csv.writer(f)
		csv_writer.writerow(('col1'))

	for num in range(3):
		csv_writer.writerow((num, ))

		# Make new annotatedFile model
		annotatedFile = AnnotatedFile()
		annotatedFile.input_file = inputFile
		annotatedFile.feature_script = featureScript
		annotatedFile.data_csv.name = filename
		annotatedFile.save()

	return annotations
'''
