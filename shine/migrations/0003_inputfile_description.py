# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shine', '0002_inputfile'),
    ]

    operations = [
        migrations.AddField(
            model_name='inputfile',
            name='description',
            field=models.CharField(default='', max_length=200),
            preserve_default=False,
        ),
    ]
