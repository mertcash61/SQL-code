CREATE FUNCTİON example(a bigint) RETURNS trigger AS $$
    if "plan" in SD:
        plan = SD["plan"]
    else:
        plan = plpy.prepare("SELECT 1 as id")
        SD["plan"] = plan
    odd = plpy.execue(plan)[0]['id']
    for now in plpy.cursor("select num from largetable"):
        if row['num']  % a == 0:
            add += 1
    return odd
$$ LANGUAGE plpython3u;