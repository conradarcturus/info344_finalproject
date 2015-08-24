from django.db import models

class Event(models.Model):
	name = models.CharField(max_length=200, primary_key=True)
	description = models.TextField()
	def __str__(self):
		return self.name

class Rumor(models.Model):
	name = models.CharField(max_length=200, primary_key=True)
	event = models.ForeignKey('Event')
	description = models.TextField()
	def __str__(self):
		return self.name

class Input(models.Model):
	created = models.DateTimeField(auto_now_add=True, primary_key=True)
	event = models.ForeignKey('Event')
	rumor = models.ForeignKey('Rumor')
	tweets = models.TextField()
	def __str__(self):
		return self.event.name + " " + self.rumor.name

class InputFile(models.Model):
	created = models.DateTimeField(auto_now_add=True, primary_key=True)
	event = models.ForeignKey('Event')
	rumor = models.ForeignKey('Rumor')
	description = models.CharField(max_length=200)
	data_csv = models.FileField()
	def __str__(self):
		return self.event.name + " " + self.rumor.name + " " + self.description

class FeatureSet(models.Model):
	created = models.DateTimeField(auto_now_add=True)
	name = models.CharField(max_length=200, primary_key=True)
	feature_script = models.ForeignKey('FeatureScript')
	event = models.ForeignKey('Event')
	rumors = models.ManyToManyField('Rumor')
	features = models.TextField()
	def __str__(self):
		return self.name

class FeatureScript(models.Model):
	created = models.DateTimeField(auto_now_add=True)
	name = models.CharField(max_length=200, primary_key=True)
	script = models.TextField()
	def __str__(self):
		return self.name

class AnnotatedFile(models.Model):
	created = models.DateTimeField(auto_now_add=True)
	input_file = models.ForeignKey('InputFile')
	feature_script = models.ForeignKey('FeatureScript')
	data_csv = models.FileField()
	def __str__(self):
			return str(self.input_file) + " " + feature_script.name

class Analysis(models.Model):
	created = models.DateTimeField(auto_now_add=True)
	name = models.CharField(max_length=200, primary_key=True)
	script = models.TextField()
	def __str__(self):
		return self.name

class Result(models.Model):
	created = models.DateTimeField(auto_now_add=True, primary_key=True)
	event = models.ForeignKey('Event')
	rumors = models.ManyToManyField('Rumor')
	feature_set = models.ForeignKey('FeatureSet')
	analysis = models.ForeignKey('Analysis')
	true_positive = models.FloatField()
	false_positive = models.FloatField()
	true_negative = models.FloatField()
	false_negative = models.FloatField()
	def __str__(self):
		return self.event + " " + self.analysis.name + " " + self.created



