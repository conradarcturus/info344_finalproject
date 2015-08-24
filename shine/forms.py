from django import forms
from shine.models import *

class UploadInputFileForm(forms.ModelForm):
	class Meta:
		model = InputFile
		fields = ['event', 'rumor', 'description', 'data_csv']

class FeatureScriptForm(forms.ModelForm):
	class Meta:
		model = FeatureScript
		fields = ['name', 'script']

class AnalysisForm(forms.ModelForm):
	class Meta:
		model = Analysis
		fields = ['name', 'script']

