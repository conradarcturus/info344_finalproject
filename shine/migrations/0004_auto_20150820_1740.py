# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shine', '0003_inputfile_description'),
    ]

    operations = [
        migrations.CreateModel(
            name='AnnotatedFile',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, primary_key=True, auto_created=True)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('feature_script', models.ForeignKey(to='shine.FeatureScript')),
            ],
        ),
        migrations.AlterField(
            model_name='inputfile',
            name='data_csv',
            field=models.FileField(upload_to='data'),
        ),
        migrations.AddField(
            model_name='annotatedfile',
            name='input_file',
            field=models.ForeignKey(to='shine.InputFile'),
        ),
    ]
