/*

Copyright 2008-2011 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.

pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

$Revision$
$Date$
$Author$
$HeaderURL$

*/
%{
#include <Handle_MMgt_TShared.hxx>
#include <Handle_Standard_AbortiveTransaction.hxx>
#include <Handle_Standard_ConstructionError.hxx>
#include <Handle_Standard_DimensionError.hxx>
#include <Handle_Standard_DimensionMismatch.hxx>
#include <Handle_Standard_DivideByZero.hxx>
#include <Handle_Standard_DomainError.hxx>
#include <Handle_Standard_Failure.hxx>
#include <Handle_Standard_ImmutableObject.hxx>
#include <Handle_Standard_LicenseError.hxx>
#include <Handle_Standard_LicenseNotFound.hxx>
#include <Handle_Standard_MultiplyDefined.hxx>
#include <Handle_Standard_NegativeValue.hxx>
#include <Handle_Standard_NoMoreObject.hxx>
#include <Handle_Standard_NoSuchObject.hxx>
#include <Handle_Standard_NotImplemented.hxx>
#include <Handle_Standard_NullObject.hxx>
#include <Handle_Standard_NullValue.hxx>
#include <Handle_Standard_NumericError.hxx>
#include <Handle_Standard_OutOfMemory.hxx>
#include <Handle_Standard_OutOfRange.hxx>
#include <Handle_Standard_Overflow.hxx>
#include <Handle_Standard_Persistent.hxx>
#include <Handle_Standard_ProgramError.hxx>
#include <Handle_Standard_RangeError.hxx>
#include <Handle_Standard_TooManyUsers.hxx>
#include <Handle_Standard_Transient.hxx>
#include <Handle_Standard_Type.hxx>
#include <Handle_Standard_TypeMismatch.hxx>
#include <Handle_Standard_Underflow.hxx>
#include <Handle_StepData_DefaultGeneral.hxx>
#include <Handle_StepData_DescrGeneral.hxx>
#include <Handle_StepData_DescrProtocol.hxx>
#include <Handle_StepData_DescrReadWrite.hxx>
#include <Handle_StepData_Described.hxx>
#include <Handle_StepData_ECDescr.hxx>
#include <Handle_StepData_EDescr.hxx>
#include <Handle_StepData_ESDescr.hxx>
#include <Handle_StepData_FileProtocol.hxx>
#include <Handle_StepData_FileRecognizer.hxx>
#include <Handle_StepData_FreeFormEntity.hxx>
#include <Handle_StepData_GeneralModule.hxx>
#include <Handle_StepData_GlobalNodeOfWriterLib.hxx>
#include <Handle_StepData_HArray1OfField.hxx>
#include <Handle_StepData_NodeOfWriterLib.hxx>
#include <Handle_StepData_PDescr.hxx>
#include <Handle_StepData_Plex.hxx>
#include <Handle_StepData_Protocol.hxx>
#include <Handle_StepData_ReadWriteModule.hxx>
#include <Handle_StepData_SelectArrReal.hxx>
#include <Handle_StepData_SelectInt.hxx>
#include <Handle_StepData_SelectMember.hxx>
#include <Handle_StepData_SelectNamed.hxx>
#include <Handle_StepData_SelectReal.hxx>
#include <Handle_StepData_Simple.hxx>
#include <Handle_StepData_StepModel.hxx>
#include <Handle_StepData_StepReaderData.hxx>
#include <Handle_StepData_UndefinedEntity.hxx>
#include <Handle_StepRepr_AssemblyComponentUsage.hxx>
#include <Handle_StepRepr_AssemblyComponentUsageSubstitute.hxx>
#include <Handle_StepRepr_CompositeShapeAspect.hxx>
#include <Handle_StepRepr_CompoundRepresentationItem.hxx>
#include <Handle_StepRepr_ConfigurationDesign.hxx>
#include <Handle_StepRepr_ConfigurationEffectivity.hxx>
#include <Handle_StepRepr_ConfigurationItem.hxx>
#include <Handle_StepRepr_DataEnvironment.hxx>
#include <Handle_StepRepr_DefinitionalRepresentation.hxx>
#include <Handle_StepRepr_DerivedShapeAspect.hxx>
#include <Handle_StepRepr_DescriptiveRepresentationItem.hxx>
#include <Handle_StepRepr_Extension.hxx>
#include <Handle_StepRepr_ExternallyDefinedRepresentation.hxx>
#include <Handle_StepRepr_FunctionallyDefinedTransformation.hxx>
#include <Handle_StepRepr_GlobalUncertaintyAssignedContext.hxx>
#include <Handle_StepRepr_GlobalUnitAssignedContext.hxx>
#include <Handle_StepRepr_HArray1OfMaterialPropertyRepresentation.hxx>
#include <Handle_StepRepr_HArray1OfPropertyDefinitionRepresentation.hxx>
#include <Handle_StepRepr_HArray1OfRepresentationItem.hxx>
#include <Handle_StepRepr_HSequenceOfMaterialPropertyRepresentation.hxx>
#include <Handle_StepRepr_HSequenceOfRepresentationItem.hxx>
#include <Handle_StepRepr_ItemDefinedTransformation.hxx>
#include <Handle_StepRepr_MakeFromUsageOption.hxx>
#include <Handle_StepRepr_MappedItem.hxx>
#include <Handle_StepRepr_MaterialDesignation.hxx>
#include <Handle_StepRepr_MaterialProperty.hxx>
#include <Handle_StepRepr_MaterialPropertyRepresentation.hxx>
#include <Handle_StepRepr_MeasureRepresentationItem.hxx>
#include <Handle_StepRepr_NextAssemblyUsageOccurrence.hxx>
#include <Handle_StepRepr_ParametricRepresentationContext.hxx>
#include <Handle_StepRepr_ProductConcept.hxx>
#include <Handle_StepRepr_ProductDefinitionShape.hxx>
#include <Handle_StepRepr_ProductDefinitionUsage.hxx>
#include <Handle_StepRepr_PromissoryUsageOccurrence.hxx>
#include <Handle_StepRepr_PropertyDefinition.hxx>
#include <Handle_StepRepr_PropertyDefinitionRelationship.hxx>
#include <Handle_StepRepr_PropertyDefinitionRepresentation.hxx>
#include <Handle_StepRepr_QuantifiedAssemblyComponentUsage.hxx>
#include <Handle_StepRepr_ReprItemAndLengthMeasureWithUnit.hxx>
#include <Handle_StepRepr_Representation.hxx>
#include <Handle_StepRepr_RepresentationContext.hxx>
#include <Handle_StepRepr_RepresentationItem.hxx>
#include <Handle_StepRepr_RepresentationMap.hxx>
#include <Handle_StepRepr_RepresentationRelationship.hxx>
#include <Handle_StepRepr_RepresentationRelationshipWithTransformation.hxx>
#include <Handle_StepRepr_SequenceNodeOfSequenceOfMaterialPropertyRepresentation.hxx>
#include <Handle_StepRepr_SequenceNodeOfSequenceOfRepresentationItem.hxx>
#include <Handle_StepRepr_ShapeAspect.hxx>
#include <Handle_StepRepr_ShapeAspectDerivingRelationship.hxx>
#include <Handle_StepRepr_ShapeAspectRelationship.hxx>
#include <Handle_StepRepr_ShapeAspectTransition.hxx>
#include <Handle_StepRepr_ShapeRepresentationRelationship.hxx>
#include <Handle_StepRepr_ShapeRepresentationRelationshipWithTransformation.hxx>
#include <Handle_StepRepr_SpecifiedHigherUsageOccurrence.hxx>
#include <Handle_StepRepr_StructuralResponseProperty.hxx>
#include <Handle_StepRepr_StructuralResponsePropertyDefinitionRepresentation.hxx>
#include <Handle_StepRepr_SuppliedPartRelationship.hxx>
#include <Handle_StepRepr_ValueRange.hxx>
#include <MMgt_StackManager.hxx>
#include <MMgt_TShared.hxx>
#include <Standard_AbortiveTransaction.hxx>
#include <Standard_Address.hxx>
#include <Standard_AncestorIterator.hxx>
#include <Standard_Assert.hxx>
#include <Standard_Boolean.hxx>
#include <Standard_Byte.hxx>
#include <Standard_CString.hxx>
#include <Standard_Character.hxx>
#include <Standard_ConstructionError.hxx>
#include <Standard_DefineAlloc.hxx>
#include <Standard_DefineException.hxx>
#include <Standard_DefineHandle.hxx>
#include <Standard_DimensionError.hxx>
#include <Standard_DimensionMismatch.hxx>
#include <Standard_DivideByZero.hxx>
#include <Standard_DomainError.hxx>
#include <Standard_ErrorHandler.hxx>
#include <Standard_ErrorHandlerCallback.hxx>
#include <Standard_ExtCharacter.hxx>
#include <Standard_ExtString.hxx>
#include <Standard_Failure.hxx>
#include <Standard_GUID.hxx>
#include <Standard_HandlerStatus.hxx>
#include <Standard_IStream.hxx>
#include <Standard_ImmutableObject.hxx>
#include <Standard_Integer.hxx>
#include <Standard_InternalType.hxx>
#include <Standard_JmpBuf.hxx>
#include <Standard_KindOfType.hxx>
#include <Standard_LicenseError.hxx>
#include <Standard_LicenseNotFound.hxx>
#include <Standard_MMgrOpt.hxx>
#include <Standard_MMgrRaw.hxx>
#include <Standard_MMgrRoot.hxx>
#include <Standard_MMgrTBBalloc.hxx>
#include <Standard_Macro.hxx>
#include <Standard_MultiplyDefined.hxx>
#include <Standard_Mutex.hxx>
#include <Standard_NegativeValue.hxx>
#include <Standard_NoMoreObject.hxx>
#include <Standard_NoSuchObject.hxx>
#include <Standard_NotImplemented.hxx>
#include <Standard_NullObject.hxx>
#include <Standard_NullValue.hxx>
#include <Standard_NumericError.hxx>
#include <Standard_OId.hxx>
#include <Standard_OStream.hxx>
#include <Standard_OutOfMemory.hxx>
#include <Standard_OutOfRange.hxx>
#include <Standard_Overflow.hxx>
#include <Standard_PByte.hxx>
#include <Standard_PCharacter.hxx>
#include <Standard_PErrorHandler.hxx>
#include <Standard_PExtCharacter.hxx>
#include <Standard_Persistent.hxx>
#include <Standard_Persistent_proto.hxx>
#include <Standard_PrimitiveTypes.hxx>
#include <Standard_ProgramError.hxx>
#include <Standard_RangeError.hxx>
#include <Standard_Real.hxx>
#include <Standard_SStream.hxx>
#include <Standard_ShortReal.hxx>
#include <Standard_Size.hxx>
#include <Standard_Storable.hxx>
#include <Standard_Stream.hxx>
#include <Standard_String.hxx>
#include <Standard_ThreadId.hxx>
#include <Standard_Time.hxx>
#include <Standard_TooManyUsers.hxx>
#include <Standard_Transient.hxx>
#include <Standard_Type.hxx>
#include <Standard_TypeDef.hxx>
#include <Standard_TypeMismatch.hxx>
#include <Standard_UUID.hxx>
#include <Standard_Underflow.hxx>
#include <Standard_Version.hxx>
#include <Standard_WayOfLife.hxx>
#include <Standard_ctype.hxx>
#include <Standard_math.hxx>
#include <StepData_Array1OfField.hxx>
#include <StepData_DefaultGeneral.hxx>
#include <StepData_DescrGeneral.hxx>
#include <StepData_DescrProtocol.hxx>
#include <StepData_DescrReadWrite.hxx>
#include <StepData_Described.hxx>
#include <StepData_ECDescr.hxx>
#include <StepData_EDescr.hxx>
#include <StepData_ESDescr.hxx>
#include <StepData_EnumTool.hxx>
#include <StepData_Field.hxx>
#include <StepData_FieldList.hxx>
#include <StepData_FieldList1.hxx>
#include <StepData_FieldListD.hxx>
#include <StepData_FieldListN.hxx>
#include <StepData_FileProtocol.hxx>
#include <StepData_FileRecognizer.hxx>
#include <StepData_FreeFormEntity.hxx>
#include <StepData_GeneralModule.hxx>
#include <StepData_GlobalNodeOfWriterLib.hxx>
#include <StepData_HArray1OfField.hxx>
#include <StepData_HeaderTool.hxx>
#include <StepData_Logical.hxx>
#include <StepData_NodeOfWriterLib.hxx>
#include <StepData_PDescr.hxx>
#include <StepData_Plex.hxx>
#include <StepData_Protocol.hxx>
#include <StepData_ReadWriteModule.hxx>
#include <StepData_SelectArrReal.hxx>
#include <StepData_SelectInt.hxx>
#include <StepData_SelectMember.hxx>
#include <StepData_SelectNamed.hxx>
#include <StepData_SelectReal.hxx>
#include <StepData_SelectType.hxx>
#include <StepData_Simple.hxx>
#include <StepData_StepDumper.hxx>
#include <StepData_StepModel.hxx>
#include <StepData_StepReaderData.hxx>
#include <StepData_StepReaderTool.hxx>
#include <StepData_StepWriter.hxx>
#include <StepData_UndefinedEntity.hxx>
#include <StepData_WriterLib.hxx>
#include <StepRepr_Array1OfMaterialPropertyRepresentation.hxx>
#include <StepRepr_Array1OfPropertyDefinitionRepresentation.hxx>
#include <StepRepr_Array1OfRepresentationItem.hxx>
#include <StepRepr_AssemblyComponentUsage.hxx>
#include <StepRepr_AssemblyComponentUsageSubstitute.hxx>
#include <StepRepr_CharacterizedDefinition.hxx>
#include <StepRepr_CompositeShapeAspect.hxx>
#include <StepRepr_CompoundRepresentationItem.hxx>
#include <StepRepr_ConfigurationDesign.hxx>
#include <StepRepr_ConfigurationDesignItem.hxx>
#include <StepRepr_ConfigurationEffectivity.hxx>
#include <StepRepr_ConfigurationItem.hxx>
#include <StepRepr_DataEnvironment.hxx>
#include <StepRepr_DefinitionalRepresentation.hxx>
#include <StepRepr_DerivedShapeAspect.hxx>
#include <StepRepr_DescriptiveRepresentationItem.hxx>
#include <StepRepr_Extension.hxx>
#include <StepRepr_ExternallyDefinedRepresentation.hxx>
#include <StepRepr_FunctionallyDefinedTransformation.hxx>
#include <StepRepr_GlobalUncertaintyAssignedContext.hxx>
#include <StepRepr_GlobalUnitAssignedContext.hxx>
#include <StepRepr_HArray1OfMaterialPropertyRepresentation.hxx>
#include <StepRepr_HArray1OfPropertyDefinitionRepresentation.hxx>
#include <StepRepr_HArray1OfRepresentationItem.hxx>
#include <StepRepr_HSequenceOfMaterialPropertyRepresentation.hxx>
#include <StepRepr_HSequenceOfRepresentationItem.hxx>
#include <StepRepr_ItemDefinedTransformation.hxx>
#include <StepRepr_MakeFromUsageOption.hxx>
#include <StepRepr_MappedItem.hxx>
#include <StepRepr_MaterialDesignation.hxx>
#include <StepRepr_MaterialProperty.hxx>
#include <StepRepr_MaterialPropertyRepresentation.hxx>
#include <StepRepr_MeasureRepresentationItem.hxx>
#include <StepRepr_NextAssemblyUsageOccurrence.hxx>
#include <StepRepr_ParametricRepresentationContext.hxx>
#include <StepRepr_ProductConcept.hxx>
#include <StepRepr_ProductDefinitionShape.hxx>
#include <StepRepr_ProductDefinitionUsage.hxx>
#include <StepRepr_PromissoryUsageOccurrence.hxx>
#include <StepRepr_PropertyDefinition.hxx>
#include <StepRepr_PropertyDefinitionRelationship.hxx>
#include <StepRepr_PropertyDefinitionRepresentation.hxx>
#include <StepRepr_QuantifiedAssemblyComponentUsage.hxx>
#include <StepRepr_ReprItemAndLengthMeasureWithUnit.hxx>
#include <StepRepr_Representation.hxx>
#include <StepRepr_RepresentationContext.hxx>
#include <StepRepr_RepresentationItem.hxx>
#include <StepRepr_RepresentationMap.hxx>
#include <StepRepr_RepresentationRelationship.hxx>
#include <StepRepr_RepresentationRelationshipWithTransformation.hxx>
#include <StepRepr_RepresentedDefinition.hxx>
#include <StepRepr_SequenceNodeOfSequenceOfMaterialPropertyRepresentation.hxx>
#include <StepRepr_SequenceNodeOfSequenceOfRepresentationItem.hxx>
#include <StepRepr_SequenceOfMaterialPropertyRepresentation.hxx>
#include <StepRepr_SequenceOfRepresentationItem.hxx>
#include <StepRepr_ShapeAspect.hxx>
#include <StepRepr_ShapeAspectDerivingRelationship.hxx>
#include <StepRepr_ShapeAspectRelationship.hxx>
#include <StepRepr_ShapeAspectTransition.hxx>
#include <StepRepr_ShapeDefinition.hxx>
#include <StepRepr_ShapeRepresentationRelationship.hxx>
#include <StepRepr_ShapeRepresentationRelationshipWithTransformation.hxx>
#include <StepRepr_SpecifiedHigherUsageOccurrence.hxx>
#include <StepRepr_StructuralResponseProperty.hxx>
#include <StepRepr_StructuralResponsePropertyDefinitionRepresentation.hxx>
#include <StepRepr_SuppliedPartRelationship.hxx>
#include <StepRepr_Transformation.hxx>
#include <StepRepr_ValueRange.hxx>
%};

%import StepRepr.i
%import MMgt.i
%import StepData.i
%import Standard.i
