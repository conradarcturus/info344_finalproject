from django.forms import widgets
from rest_framework import serializers
from shine.models import *

class EventSerializer(serializers.ModelSerializer):
	class Meta:
		model = Event
		fields = ('name',)

class RumorSerializer(serializers.ModelSerializer):
	class Meta:
		model = Rumor
		fields = ('name','event')

class InputSerializer(serializers.ModelSerializer):
	class Meta:
		model = Input
		fields = ('id', 'created', 'event', 'rumor', 'tweets')

class InputFileSerializer(serializers.ModelSerializer):
	class Meta:
		model = InputFile
		fields = ('created', 'event', 'rumor', 'description', 'data_csv')

class FeatureSetSerializer(serializers.ModelSerializer):
	rumors = serializers.SlugRelatedField(many=True, read_only=True, slug_field='name')
	class Meta:
		model = FeatureSet
		fields = ('id', 'created', 'event', 'rumors', 'name', 'features')	

class FeatureScriptSerializer(serializers.ModelSerializer):
	class Meta:
		model = FeatureScript
		fields = ('id', 'created', 'name', 'script')

class AnnotatedFileSerializer(serializers.ModelSerializer):
	class Meta:
		model = FeatureScript
		fields = ('id', 'created', 'input_file', 'feature_script', 'data_csv')	

class AnalysisSerializer(serializers.ModelSerializer):
	class Meta:
		model = Analysis
		fields = ('id', 'created', 'title', 'script')	

class ResultSerializer(serializers.ModelSerializer):
	rumors = serializers.SlugRelatedField(many=True, read_only=True, slug_field='name')
	class Meta:
		model = FeatureSet
		fields = ('id', 'created', 'event', 'rumors', 'feature_name', 'analysis_title', 'true_positive', 'false_positive', 'true_negative', 'false_negative', 'labels')	


