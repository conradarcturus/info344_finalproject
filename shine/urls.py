from django.conf.urls import include, url
from rest_framework.urlpatterns import format_suffix_patterns
from shine import rest_api
from shine.views import *

urlpatterns = [            

	url(r'^$', get_primary_data),

	url(r'^dataset/new/$',               DatasetCreate.as_view(), name='new_input_file'),
	url(r'^dataset/edit/(?P<pk>.+)/$',   DatasetUpdate.as_view(), name='edit_input_file'),
	url(r'^dataset/remove/(?P<pk>.+)/$', DatasetDelete.as_view(), name='remove_input_file'),

	url(r'^feature_script/new/$',               FeatureScriptCreate.as_view(), name='new_feature_script'),
	url(r'^feature_script/edit/(?P<pk>.+)/$',   FeatureScriptUpdate.as_view(), name='edit_feature_script'),
	url(r'^feature_script/remove/(?P<pk>.+)/$', FeatureScriptDelete.as_view(), name='remove_feature_script'),

	url(r'^classifier/new/$',               ClassifierCreate.as_view(), name='new_classifier'),
	url(r'^classifier/edit/(?P<pk>.+)/$',   ClassifierUpdate.as_view(), name='edit_classifier'),
	url(r'^classifier/remove/(?P<pk>.+)/$', ClassifierDelete.as_view(), name='remove_classifier'),


	#rest api 
	#need to change the inputfile rest api after removing them from view
	url(r'^input_rest_api/$', rest_api.input_file_list),
	url(r'^input_rest_api/(?P<pk>.+)/$', rest_api.input_file_detail, name='input_detail'),

	url(r'^event_rest_api/$', rest_api.event_list),
	url(r'^event_rest_api/(?P<pk>.+)/$', rest_api.event_detail, name='event_detail'),

	url(r'^rumor_rest_api/$', rest_api.rumor_list),
	url(r'^rumor_rest_api/(?P<pk>.+)/$', rest_api.rumor_detail, name='input_file_detail'),

	url(r'^feature_script_rest_api/$', rest_api.feature_script_list),
	url(r'^feature_script_rest_api/(?P<pk>.+)/$', rest_api.feature_script_detail, name='feature_script_detail'),

	url(r'^annotated_file_rest_api/$', rest_api.annotated_file_list),
	url(r'^annotated_file_rest_api/(?P<pk>.+)/$', rest_api.annotated_file_detail, name='annotated_file_detail'),

	url(r'^analysis_rest_api/$', rest_api.analysis_list),
	url(r'^analysis_rest_api/(?P<pk>.+)/$', rest_api.analysis_detail, name='analysis_detail'),

	url(r'^result_rest_api/$', rest_api.result_list),
	url(r'^result_rest_api/(?P<pk>.+)/$', rest_api.result_detail, name='result_detail'),



	url(r'^gen_feats$', generate_features),
	url(r'^external_api$', external_api),
]

#urlpatterns = format_suffix_patterns(urlpatterns)

