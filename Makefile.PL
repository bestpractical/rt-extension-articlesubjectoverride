use inc::Module::Install;


RTx 'RT-Extension-ArticleSubjectOverride';
all_from 'lib/RT/Extension/ArticleSubjectOverride.pm';
readme_from 'lib/RT/Extension/ArticleSubjectOverride.pm';
license  'gplv2';

requires_rt('4.0.1');
rt_too_new('4.2.0');

sign;
WriteAll;
