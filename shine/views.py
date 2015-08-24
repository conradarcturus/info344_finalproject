from django.shortcuts import render
from django.shortcuts import redirect
from django.shortcuts import render, get_object_or_404
from rest_framework import status 
from rest_framework.decorators import api_view 
from rest_framework.response import Response 
from shine.models import * 
from shine.serializers import *
from shine.forms import *
from shine.process_tweets import *
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect, HttpResponse
from django.views.generic import CreateView, UpdateView, DeleteView, ListView, DetailView
#from myproject.core.views import MessageMixin
from django.core.urlresolvers import reverse_lazy
import string, re
from shine.external_api import *

HOME_URL = '/misinfotools/'

@login_required(login_url='accounts/login/')
def external_api(request):

	try:
		inputFile = InputFile.objects.get(pk="2015-08-23 20:41:08+00:00")
	except InputFile.DoesNotExist:
		return Response(status=status.HTTP_404_NOT_FOUND)

	#for inputFile in inputFiles:
	tweets = readTweets(inputFile.data_csv.url)
	#	break
	result = verify_tweets(tweets)

	return HttpResponse(result)

@login_required(login_url='accounts/login/')
def generate_features(request):

	try:
		inputFile = InputFile.objects.get(pk="2015-08-23 20:41:08+00:00")
		featureScript = FeatureScript.objects.get(pk="TweetLengthExtractor")
	except InputFile.DoesNotExist:
		return Response(status=status.HTTP_404_NOT_FOUND)

	features = executeFeatureScript(inputFile, featureScript)

	return HttpResponse(features, content_type='text/plain')
	# return render(request, 'shine/edit_form.html', {'title': "Input File", 'form': form})

class DatasetCreate(CreateView):
	model = InputFile
	fields = ['event', 'rumor', 'description', 'data_csv']
	template_name = 'forms/edit.html'
	success_url = HOME_URL

class DatasetUpdate(UpdateView):
	model = InputFile
	fields = ['event', 'rumor', 'description', 'data_csv']
	template_name = 'forms/edit.html'
	success_url = HOME_URL

class DatasetDelete(DeleteView):
	model = InputFile
	success_url = HOME_URL
	template_name = 'forms/delete.html'

	@login_required(login_url='accounts/login/')
	def post(self, request, *args, **kwargs):
		if "cancel" in request.POST:
			return HttpResponseRedirect(HOME_URL)
		else:
			return super(DatasetDelete, self).post(request, *args, **kwargs)

class FeatureScriptCreate(CreateView):
	model = FeatureScript
	fields = ['name', 'script']
	template_name = 'forms/edit.html'
	success_url = HOME_URL

class FeatureScriptUpdate(UpdateView):
	model = FeatureScript
	fields = ['name', 'script']
	template_name = 'forms/edit.html'
	success_url = HOME_URL

class FeatureScriptDelete(DeleteView):
	model = FeatureScript
	success_url = HOME_URL
	template_name = 'forms/delete.html'

	@login_required(login_url='accounts/login/')
	def post(self, request, *args, **kwargs):
		if "cancel" in request.POST:
			return HttpResponseRedirect(HOME_URL)
		else:
			return super(FeatureScriptDelete, self).post(request, *args, **kwargs)

class ClassifierCreate(CreateView):
	model = Analysis
	fields = ['name', 'script']
	template_name = 'forms/edit.html'
	success_url = HOME_URL

class ClassifierUpdate(UpdateView):
	model = Analysis
	fields = ['name', 'script']
	template_name = 'forms/edit.html'
	success_url = HOME_URL

class ClassifierDelete(DeleteView):
	model = Analysis
	success_url = HOME_URL
	template_name = 'forms/delete.html'

	@login_required(login_url='accounts/login/')
	def post(self, request, *args, **kwargs):
		if "cancel" in request.POST:
			return HttpResponseRedirect(HOME_URL)
		else:
			return super(ClassifierDelete, self).post(request, *args, **kwargs)

@login_required(login_url='accounts/login/')
def get_primary_data(request):
	inputFiles = InputFile.objects.all()
	datasets = []
	for inputFile in inputFiles:
		tweets = readTweets(inputFile.data_csv.url)
		tweets = verify_tweets(tweets)
		example = ""
		if(tweets and 'text' in tweets[0]):
			example = tweets[0]['text']
		key = "ds" + removeNonAlphaNum(str(inputFile.created))
		datasets.append({'tweets': tweets, 'event': inputFile.event, 'description': inputFile.description, 'rumor': inputFile.rumor, 'example': example, 'key': key, 'pk': inputFile.pk})

	feature_scripts = FeatureScript.objects.all()
	feature_scripts2 = []
	for feature_script in feature_scripts:
		excerpt = feature_script.script[:50]
		key = "fs" + removeNonAlphaNum(str(feature_script.created))
		feature_scripts2.append({'name': feature_script.name, 'script': feature_script.script, 'excerpt': excerpt, 'key': key, 'pk': feature_script.pk})

	analysis_scripts = Analysis.objects.all()
	classifiers = []
	for analysis_script in analysis_scripts:
		excerpt = analysis_script.script[:50]
		key = "cs" + removeNonAlphaNum(str(analysis_script.created))
		classifiers.append({'name': analysis_script.name, 'script': analysis_script.script, 'excerpt': excerpt, 'key': key, 'pk': analysis_script.pk})

	return render(request, 'shine/shine.html', {'datasets': datasets, 'feature_scripts': feature_scripts2, 'classifiers': classifiers})
