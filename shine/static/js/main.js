function collect_sections()
{
	datasets = $(".check_ds:checked").map(
		function () {return this.value;}).get();
	feature_scripts = $(".check_ds:checked").map(
		function () {return this.value;}).get();
	
	return {'datasets': datasets, 'feature_scripts': feature_scripts}
}