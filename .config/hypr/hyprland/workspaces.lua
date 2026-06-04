local special_gaps = 48

hl.workspace_rule({
   workspace = 'special:comms',
   on_created_empty = 'thunderbird',
   persistent = false,
   gaps_out = special_gaps,
})

hl.workspace_rule({
   workspace = 'special:music',
   on_created_empty = 'spotify',
   persistent = false,
   gaps_out = special_gaps,
})

hl.workspace_rule({
   workspace = 'special:scratchpad',
})
