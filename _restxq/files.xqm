xquery version '3.0' ;
module namespace synopsx.files = 'synopsx.files' ;

(:~
 : This module is the RESTXQ for SynopsX's installation processes
 :
 : @version 2.0 (Constantia edition)
 : @since 2015-02-23
 : @author synopsx team
 :
 : This file is part of SynopsX.
 : created by AHN team (http://ahn.ens-lyon.fr)
 :
 : SynopsX is free software: you can redistribute it and/or modify
 : it under the terms of the GNU General Public License as published by
 : the Free Software Foundation, either version 3 of the License, or
 : (at your option) any later version.
 :
 : SynopsX is distributed in the hope that it will be useful,
 : but WITHOUT ANY WARRANTY; without even the implied warranty of
 : MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 : See the GNU General Public License for more details.
 : You should have received a copy of the GNU General Public License along 
 : with SynopsX. If not, see http://www.gnu.org/licenses/
 :
 :)

import module namespace G = 'synopsx.globals' at '../globals.xqm' ;

(:~
: resource function for the static files
:
: @param $file file or unknown path
: @return rest response and binary file
:)
declare
%rest:path('/synopsx/files/{$file=.+}')
function synopsx.files:file($file as xs:string) as item()+ {
    let $path := $G:FILES || $file
    return (
      web:response-header(map { 'media-type': web:content-type($path) }),
      file:read-binary($path)
    )
};

