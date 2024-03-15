json.info render(partial: 'addbuddy', locals: {buddy: @buddy}, formats: [:html])
json.status @buddy.valid?
