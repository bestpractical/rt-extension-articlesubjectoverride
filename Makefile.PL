use inc::Module::Install;


RTx 'RT-Extension-ArticleSubjectOverride';
all_from 'lib/RT/Extension/ArticleSubjectOverride.pm';
readme_from 'lib/RT/Extension/ArticleSubjectOverride.pm';
license  'gplv2';

sign;
WriteAll;
