// Checks that forward declarations from headers are not ucompleted in TUs.
#include "enum_decl_ty_header_completes.h"
//- HeaderAnchor defines/binding HEnumEFwd
//- HeaderAnchor=vname(_,_,_,
//-     "kythe/cxx/indexer/cxx/testdata/basic/enum_decl_ty_header_completes.h",
//-     _).node/kind anchor
//- @E defines/binding EnumEFwd
//- EnumEFwd.complete complete
enum class E : short;
//- @E defines/binding EnumE
//- @E completes/uniquely EnumEFwd
//- @E completes HEnumEFwd
enum class E : short { };
//- EnumE typed ShortType
//- EnumE.complete definition
//- HEnumEFwd.complete complete
//- HEnumEFwd typed ShortType
