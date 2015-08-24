# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shine', '0004_auto_20150820_1740'),
    ]

    operations = [
        migrations.AddField(
            model_name='annotatedfile',
            name='data_csv',
            field=models.FileField(upload_to='', default=''),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='inputfile',
            name='data_csv',
            field=models.FileField(upload_to=''),
        ),
    ]
