include(GenerateExportHeader)

set(PROJECT_SOURCES
)

add_library(parser ${PROJECT_SOURCES})

add_library(lingua::parser ALIAS parser)

target_link_libraries(parser PRIVATE options warnings)
target_include_directories(parser ${WARNING_GUARD} PUBLIC $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
                                                              $<BUILD_INTERFACE:${PROJECT_BINARY_DIR}/include>)

target_compile_features(parser PUBLIC cxx_std_20)

set_target_properties(
  parser
  PROPERTIES VERSION ${PROJECT_VERSION}
             CXX_VISIBILITY_PRESET hidden
             VISIBILITY_INLINES_HIDDEN YES)
             
generate_export_header(parser EXPORT_FILE_NAME ${PROJECT_BINARY_DIR}/include/lingua/parser_export.h)

if(NOT BUILD_SHARED_LIBS)
  target_compile_definitions(parser PUBLIC SCRIPT_STATIC_DEFINE)
endif()
