Package.describe({
  summary: 'mapify comments package'
});

Package.onUse(function(api) {
  api.use([
    'mapify-accounts'
  ]);

  api.imply([
    'mapify-accounts'
  ]);

  api.addFiles([
    'lib/comments.coffee'
  ]);
});
