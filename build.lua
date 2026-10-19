-- Build configuration for ltx-talk-au

module = "ltx-talk-au"

sourcefiles = {"*.dtx" , "*.ins" , "*.tex", "support/*.ttf"}

installfiles = {"*.cls", "*.def", "*.ttf"}
tdslocations = {"fonts/truetype/github/monasans/*.ttf"}
packtdszip = true

stdengine = "luatex"

checkformat = "latex"
checkengines = {"luatex"}
checksuppfiles = {"*.ttf"}
checkruns = 2

typesetexe = "lualatex"
typesetsuppfiles = {"*.ttf"}
typesetdemofiles = {"ltx-talk-au-example.tex"}

-- Build an Overleaf template archive
-- run l3build overleaf

overleaf = { "main.tex", "latexmkrc" }

local function build_overleaf()
  local zipexe   = "zip"
  local zipopts  = "-j"
  local zipname  = module .. "-overleaf.zip"
  local stagedir = builddir .. "/overleaf"
  cleandir(stagedir)
  local absstage = abspath(stagedir)
  local zippath  = abspath(currentdir) .. "/" .. zipname
  for _, f in ipairs(overleaf) do
    cp(f, maindir .. "/overleaf", stagedir)
  end
  for _, g in ipairs(installfiles) do
    cp(g, unpackdir, stagedir)
  end
  local files = {}
  for _, name in ipairs(filelist(stagedir)) do
    files[#files + 1] = '"' .. absstage .. "/" .. name .. '"'
  end
  rm(currentdir, zipname)
  return run(currentdir,
             zipexe .. " " .. zipopts .. " \"" .. zippath .. "\" "
             .. table.concat(files, " "))
end

target_list = target_list or {}
target_list.overleaf = {
  func = build_overleaf,
  desc = "Creates Overleaf template archive",
  pre  = function() return unpack() end,
}

-- Also clean the overleaf build directory

local orig_clean = target_list.clean.func
target_list.clean.func = function(...)
  local errorlevel = orig_clean(...)
  if errorlevel ~= 0 then return errorlevel end

  local dir = builddir .. "/overleaf"
  if direxists(dir) then
    cleandir(dir)
  end
  return 0
end

-- Tagging

tagfiles = {"*.dtx", "*.ins", "README.md"}

function update_tag(file, content, tagname, tagdate)
  -- Update version in LaTeX package/class
  content = content:gsub(
    "(\\Provides%w+%s*%b{}%s*%[)%d%d%d%d%-%d%d%-%d%d%s+v[%d%.%a]+",
    "%1" .. tagdate .. " v" .. tagname
  )

  -- Update version in Expl package/class
  content = content:gsub(
    "(\\ProvidesExpl%w+%s*%b{}%s*)(%b{})(%s*)(%b{})",
    function(prefix, _date, ws, _ver)
      return prefix
        .. "{" .. tagdate .. "}"
        .. ws
        .. "{" .. tagname .. "}"
    end
  )

  -- Update version in documentation
  content = content:gsub(
    "(\\date%{)%d%d%d%d[%-%/]%d%d[%-%/]%d%d%s+v[%d%.%a]+(%})",
    "%1" .. tagdate .. " v" .. tagname .. "%2"
  )

  -- Update end year in copyright range: Copyright (c) YYYY-YYYY
  content = content:gsub(
    "(Copyright %([Cc]%) %d%d%d%d%-)(%d%d%d%d)",
    function(prefix, endyear)
      local tagyear = tagdate:sub(1, 4)
      if tagyear > endyear then
        return prefix .. tagyear
      else
        return prefix .. endyear
      end
    end
  )

  -- Update single copyright year: if tagdate year is greater, convert to range
  content = content:gsub(
    "(Copyright %([Cc]%) )(%d%d%d%d)([^%-%d])",
    function(prefix, year, after)
      local tagyear = tagdate:sub(1, 4)
      if tagyear > year then
        return prefix .. year .. "-" .. tagyear .. after
      else
        return prefix .. year .. after
      end
    end
  )

  return content
end
