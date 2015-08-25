from django.contrib.auth.decorators import login_required
from rest_framework.decorators import api_view 
from rest_framework.response import Response 
from shine.models import *
from shine.serializers import *

#input file
@login_required
@api_view(['GET', 'POST'])
def input_file_list(request, format=None):
	"""     List all users, or create a new user.     """
	if request.method == 'GET':
		inputFile = InputFile.objects.all()
		serializer = InputFileSerializer(inputFile, many=True)
		return Response(serializer.data)
	elif request.method == 'POST':
		serializer = InputFileSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@login_required
@api_view(['GET', 'PUT', 'DELETE'])
def input_file_detail(request, pk, format=None):
	"""
	Retrieve, update or delete a input file instance.
	"""
	try:
		inputFile = InputFile.objects.get(pk=pk)
	except InputFile.DoesNotExist:
		return Response(status=status.HTTP_404_NOT_FOUND)


	if request.method == 'GET':
		serializer = InputFileSerializer(inputFile)
		return Response(serializer.data)

	elif request.method == 'PUT':
		serializer = InputFileSerializer(inputFile, data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

	elif request.method == 'DELETE':
		inputFile.delete()
		return Response(status=status.HTTP_204_NO_CONTENT)


#Event
@login_required
@api_view(['GET', 'POST'])
def event_list(request, format=None):
	"""     List all users, or create a new user.     """
	if request.method == 'GET':
		event = Event.objects.all()
		serializer = EventSerializer(event, many=True)
		return Response(serializer.data)
	elif request.method == 'POST':
		serializer = EventSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@login_required
@api_view(['GET', 'PUT', 'DELETE'])
def event_detail(request, pk, format=None):
	"""
	Retrieve, update or delete a input file instance.
	"""
	try:
		event = Event.objects.get(pk=pk)
	except Event.DoesNotExist:
		return Response(status=status.HTTP_404_NOT_FOUND)


	if request.method == 'GET':
		serializer = EventSerializer(event)
		return Response(serializer.data)

	elif request.method == 'PUT':
		serializer = EventSerializer(event, data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

	elif request.method == 'DELETE':
		event.delete()
		return Response(status=status.HTTP_204_NO_CONTENT)


#Rumor
@login_required
@api_view(['GET', 'POST'])
def rumor_list(request, format=None):
	"""     List all users, or create a new user.     """
	if request.method == 'GET':
		rumor = Rumor.objects.all()
		serializer = RumorSerializer(rumor, many=True)
		return Response(serializer.data)
	elif request.method == 'POST':
		serializer = RumorSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@login_required
@api_view(['GET', 'PUT', 'DELETE'])
def rumor_detail(request, pk, format=None):
	"""
	Retrieve, update or delete a input file instance.
	"""
	try:
		rumor = Rumor.objects.get(pk=pk)
	except Rumor.DoesNotExist:
		return Response(status=status.HTTP_404_NOT_FOUND)


	if request.method == 'GET':
		serializer = RumorSerializer(rumor)
		return Response(serializer.data)

	elif request.method == 'PUT':
		serializer = RumorSerializer(rumor, data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

	elif request.method == 'DELETE':
		rumor.delete()
		return Response(status=status.HTTP_204_NO_CONTENT)


#FeatureScript
@login_required
@api_view(['GET', 'POST'])
def feature_script_list(request, format=None):
	"""     List all users, or create a new user.     """
	if request.method == 'GET':
		featureScript = FeatureScript.objects.all()
		serializer = FeatureScriptSerializer(featureScript, many=True)
		return Response(serializer.data)
	elif request.method == 'POST':
		serializer = FeatureScriptSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@login_required
@api_view(['GET', 'PUT', 'DELETE'])
def feature_script_detail(request, pk, format=None):
	"""
	Retrieve, update or delete a input file instance.
	"""
	try:
		featureScript = FeatureScript.objects.get(pk=pk)
	except FeatureScript.DoesNotExist:
		return Response(status=status.HTTP_404_NOT_FOUND)


	if request.method == 'GET':
		serializer = FeatureScriptSerializer(featureScript)
		return Response(serializer.data)

	elif request.method == 'PUT':
		serializer = FeatureScriptSerializer(featureScript, data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

	elif request.method == 'DELETE':
		featureScript.delete()
		return Response(status=status.HTTP_204_NO_CONTENT)

#AnnotatedFile
@login_required
@api_view(['GET', 'POST'])
def annotated_file_list(request, format=None):
	"""     List all users, or create a new user.     """
	if request.method == 'GET':
		annotatedFile = AnnotatedFile.objects.all()
		serializer = AnnotatedFileSerializer(annotatedFile, many=True)
		return Response(serializer.data)
	elif request.method == 'POST':
		serializer = AnnotatedFileSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@login_required
@api_view(['GET', 'PUT', 'DELETE'])
def annotated_file_detail(request, pk, format=None):
	"""
	Retrieve, update or delete a input file instance.
	"""
	try:
		annotatedFile = AnnotatedFile.objects.get(pk=pk)
	except AnnotatedFile.DoesNotExist:
		return Response(status=status.HTTP_404_NOT_FOUND)


	if request.method == 'GET':
		serializer = AnnotatedFileSerializer(annotatedFile)
		return Response(serializer.data)

	elif request.method == 'PUT':
		serializer = AnnotatedFileSerializer(annotatedFile, data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

	elif request.method == 'DELETE':
		annotatedFile.delete()
		return Response(status=status.HTTP_204_NO_CONTENT)


#Analysis
@login_required
@api_view(['GET', 'POST'])
def analysis_list(request, format=None):
	"""     List all users, or create a new user.     """
	if request.method == 'GET':
		analysis = Analysis.objects.all()
		serializer = AnalysisSerializer(analysis, many=True)
		return Response(serializer.data)
	elif request.method == 'POST':
		serializer = AnalysisSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@login_required
@api_view(['GET', 'PUT', 'DELETE'])
def analysis_detail(request, pk, format=None):
	"""
	Retrieve, update or delete a input file instance.
	"""
	try:
		analysis = Analysis.objects.get(pk=pk)
	except Analysis.DoesNotExist:
		return Response(status=status.HTTP_404_NOT_FOUND)


	if request.method == 'GET':
		serializer = AnalysisSerializer(analysis)
		return Response(serializer.data)

	elif request.method == 'PUT':
		serializer = AnalysisSerializer(analysis, data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

	elif request.method == 'DELETE':
		analysis.delete()
		return Response(status=status.HTTP_204_NO_CONTENT)


#Result
@login_required
@api_view(['GET', 'POST'])
def result_list(request, format=None):
	"""     List all users, or create a new user.     """
	if request.method == 'GET':
		result = Result.objects.all()
		serializer = ResultSerializer(result, many=True)
		return Response(serializer.data)
	elif request.method == 'POST':
		serializer = ResultSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@login_required
@api_view(['GET', 'PUT', 'DELETE'])
def result_detail(request, pk, format=None):
	"""
	Retrieve, update or delete a input file instance.
	"""
	try:
		result = Result.objects.get(pk=pk)
	except Result.DoesNotExist:
		return Response(status=status.HTTP_404_NOT_FOUND)


	if request.method == 'GET':
		serializer = ResultSerializer(result)
		return Response(serializer.data)

	elif request.method == 'PUT':
		serializer = ResultSerializer(result, data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

	elif request.method == 'DELETE':
		result.delete()
		return Response(status=status.HTTP_204_NO_CONTENT)