const locale = require('locale')


supported = new locale.Locales(['en', 'en_US'], 'en');
console.log ((new locale.Locales('en')).best(supported).toString());     // 'en'
console.log ((new locale.Locales('en_GB')).best(supported).toString());  // 'en'
console.log ((new locale.Locales('en_US')).best(supported).toString());  // 'en_US'
console.log ((new locale.Locales('jp')).best(supported).toString());  // en


supported = new locale.Locales(['zh-Hans', 'en-SG'], 'zh-Hans');
console.log ((new locale.Locales('en')).best(supported).toString());     // 'en-SG'
console.log ((new locale.Locales('en_GB')).best(supported).toString());  // 'en-SG'
console.log ((new locale.Locales('en_US')).best(supported).toString());  // 'en-SG'
console.log ((new locale.Locales('jp')).best(supported).toString()); // zh-Hans