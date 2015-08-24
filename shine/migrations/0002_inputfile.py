# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shine', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='InputFile',
            fields=[
                ('created', models.DateTimeField(auto_now_add=True, serialize=False, primary_key=True)),
                ('data_csv', models.FileField(upload_to='')),
                ('event', models.ForeignKey(to='shine.Event')),
                ('rumor', models.ForeignKey(to='shine.Rumor')),
            ],
        ),
    ]
