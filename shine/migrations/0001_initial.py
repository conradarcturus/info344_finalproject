# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Analysis',
            fields=[
                ('created', models.DateTimeField(auto_now_add=True)),
                ('name', models.CharField(max_length=200, serialize=False, primary_key=True)),
                ('script', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('name', models.CharField(max_length=200, serialize=False, primary_key=True)),
                ('description', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='FeatureScript',
            fields=[
                ('created', models.DateTimeField(auto_now_add=True)),
                ('name', models.CharField(max_length=200, serialize=False, primary_key=True)),
                ('script', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='FeatureSet',
            fields=[
                ('created', models.DateTimeField(auto_now_add=True)),
                ('name', models.CharField(max_length=200, serialize=False, primary_key=True)),
                ('features', models.TextField()),
                ('event', models.ForeignKey(to='shine.Event')),
                ('feature_script', models.ForeignKey(to='shine.FeatureScript')),
            ],
        ),
        migrations.CreateModel(
            name='Input',
            fields=[
                ('created', models.DateTimeField(serialize=False, primary_key=True, auto_now_add=True)),
                ('tweets', models.TextField()),
                ('event', models.ForeignKey(to='shine.Event')),
            ],
        ),
        migrations.CreateModel(
            name='Result',
            fields=[
                ('created', models.DateTimeField(serialize=False, primary_key=True, auto_now_add=True)),
                ('true_positive', models.FloatField()),
                ('false_positive', models.FloatField()),
                ('true_negative', models.FloatField()),
                ('false_negative', models.FloatField()),
                ('analysis', models.ForeignKey(to='shine.Analysis')),
                ('event', models.ForeignKey(to='shine.Event')),
                ('feature_set', models.ForeignKey(to='shine.FeatureSet')),
            ],
        ),
        migrations.CreateModel(
            name='Rumor',
            fields=[
                ('name', models.CharField(max_length=200, serialize=False, primary_key=True)),
                ('description', models.TextField()),
                ('event', models.ForeignKey(to='shine.Event')),
            ],
        ),
        migrations.AddField(
            model_name='result',
            name='rumors',
            field=models.ManyToManyField(to='shine.Rumor'),
        ),
        migrations.AddField(
            model_name='input',
            name='rumor',
            field=models.ForeignKey(to='shine.Rumor'),
        ),
        migrations.AddField(
            model_name='featureset',
            name='rumors',
            field=models.ManyToManyField(to='shine.Rumor'),
        ),
    ]
