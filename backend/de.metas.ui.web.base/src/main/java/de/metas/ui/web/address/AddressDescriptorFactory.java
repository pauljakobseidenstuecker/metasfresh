package de.metas.ui.web.address;

import de.metas.cache.CCache;
import de.metas.common.util.Check;
import de.metas.i18n.IMsgBL;
import de.metas.i18n.ITranslatableString;
import de.metas.location.CountryId;
import de.metas.location.ICountryDAO;
import de.metas.ui.web.window.datatypes.DocumentType;
import de.metas.ui.web.window.datatypes.LookupValue.IntegerLookupValue;
import de.metas.ui.web.window.descriptor.DocumentEntityDataBindingDescriptor;
import de.metas.ui.web.window.descriptor.DocumentEntityDataBindingDescriptor.DocumentEntityDataBindingDescriptorBuilder;
import de.metas.ui.web.window.descriptor.DocumentEntityDescriptor;
import de.metas.ui.web.window.descriptor.DocumentFieldDataBindingDescriptor;
import de.metas.ui.web.window.descriptor.DocumentFieldDescriptor;
import de.metas.ui.web.window.descriptor.DocumentFieldDescriptor.Characteristic;
import de.metas.ui.web.window.descriptor.DocumentFieldWidgetType;
import de.metas.ui.web.window.descriptor.DocumentLayoutElementDescriptor;
import de.metas.ui.web.window.descriptor.DocumentLayoutElementFieldDescriptor;
import de.metas.ui.web.window.descriptor.factory.standard.DefaultValueExpressionsFactory;
import de.metas.ui.web.window.model.DocumentsRepository;
import de.metas.ui.web.window.model.IDocumentFieldView;
import de.metas.util.Services;
import lombok.NonNull;
import org.adempiere.ad.callout.api.ICalloutField;
import org.adempiere.ad.expression.api.IExpression;
import org.adempiere.model.InterfaceWrapperHelper;
import org.adempiere.service.ISysConfigBL;
import org.compiere.model.I_C_Country;
import org.compiere.model.I_C_Location;
import org.compiere.model.I_C_Postal;
import org.compiere.model.I_C_Region;
import org.compiere.model.POInfo;
import org.compiere.util.Env;
import org.springframework.stereotype.Component;

import javax.annotation.Nullable;
import java.util.Optional;
import java.util.function.BiConsumer;
import java.util.function.Function;

/*
 * #%L
 * metasfresh-webui-api
 * %%
 * Copyright (C) 2016 metas GmbH
 * %%
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as
 * published by the Free Software Foundation, either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program. If not, see
 * <http://www.gnu.org/licenses/gpl-2.0.html>.
 * #L%
 */

@Component
public class AddressDescriptorFactory
{
	private final CCache<Integer, AddressDescriptor> cache = CCache.newLRUCache("AddressDescriptor", 1, 0);

	private static final String SYSCONFIG_UsePostalLookup = "de.metas.ui.web.address.UsePostalLookup";
	private static final String SYSCONFIG_AllowPOBoxAddress = "de.metas.ui.web.address.AllowPOBoxAddress";

	private static final String SYSCONFIG_ShowAddress3 = "de.metas.ui.web.address.ShowAddress3";
	private static final String SYSCONFIG_ShowAddress4 = "de.metas.ui.web.address.ShowAddress4";

	private static final String SYSCONFIG_PREFIX = "de.metas.ui.web.address.AddressDescriptorFactory.";
	private static final String SYSCONFIG_SUFIX = ".IsDisplay";
	
	private final ISysConfigBL sysConfigBL = Services.get(ISysConfigBL.class);

	public AddressDescriptor getAddressDescriptor()
	{
		final int key = 0; // some dummy key
		return cache.getOrLoad(key, this::createAddressDescriptor);
	}

	private boolean isUsePostalLookup()
	{
		final boolean defaultWhenNotFound = false; // don't use postal lookup by default
		return sysConfigBL.getBooleanValue(SYSCONFIG_UsePostalLookup, defaultWhenNotFound);

	}

	private boolean isAllowPOBoxAddress()
	{
		final boolean defaultWhenNotFound = false; // don't allow POBox address by default
		return sysConfigBL.getBooleanValue(SYSCONFIG_AllowPOBoxAddress, defaultWhenNotFound);
	}

	private boolean isShowAddress3()
	{
		final boolean defaultWhenNotFound = true; //show Address3 field by default
		return sysConfigBL.getBooleanValue(SYSCONFIG_ShowAddress3, defaultWhenNotFound);
	}

	private boolean isShowAddress4()
	{
		final boolean defaultWhenNotFound = true; //show Address4 field by default
		return sysConfigBL.getBooleanValue(SYSCONFIG_ShowAddress4, defaultWhenNotFound);
	}

	private AddressDescriptor createAddressDescriptor()
	{
		final DocumentEntityDescriptor entityDescriptor = createAddressEntityDescriptor();
		final AddressLayout layout = createLayout(entityDescriptor);
		return AddressDescriptor.of(entityDescriptor, layout);
	}

	private DocumentEntityDescriptor createAddressEntityDescriptor()
	{
		final DocumentEntityDescriptor.Builder addressDescriptor = DocumentEntityDescriptor.builder()
				.setDocumentType(DocumentType.Address, AddressDescriptor.DocumentTypeId) // we have only one descriptor for all addresses
				.setCaption(Services.get(IMsgBL.class).getTranslatableMsgText("C_Location_ID"))
				.setDataBinding(new AddressDataBindingDescriptorBuilder())
				.disableDefaultTableCallouts();

		addressDescriptor.addField(buildFieldDescriptor((IAddressModel.COLUMNNAME_Street))
										   .setValueClass(String.class)
										   .setWidgetType(DocumentFieldWidgetType.Text)
										   .setDisplayLogic(getSysConfigDisplayValue(I_C_Location.COLUMNNAME_Street))
										   .setMandatoryLogic(getMandatoryLogic(I_C_Location.COLUMNNAME_Street))
										   .setDataBinding(new AddressFieldBinding(IAddressModel.COLUMNNAME_Street, false, I_C_Location::getStreet, AddressFieldBinding::writeValue_Street)));

		addressDescriptor.addField(buildFieldDescriptor((IAddressModel.COLUMNNAME_HouseNumber))
										   .setValueClass(String.class)
										   .setWidgetType(DocumentFieldWidgetType.Text)
										   .setDisplayLogic(getSysConfigDisplayValue(I_C_Location.COLUMNNAME_HouseNumber))
										   .setMandatoryLogic(getMandatoryLogic(I_C_Location.COLUMNNAME_HouseNumber))
										   .setDataBinding(new AddressFieldBinding(IAddressModel.COLUMNNAME_HouseNumber, false, I_C_Location::getHouseNumber, AddressFieldBinding::writeValue_HouseNumber)));

		addressDescriptor.addField(buildFieldDescriptor((IAddressModel.COLUMNNAME_DHL_PostId))
										   .setValueClass(String.class)
										   .setWidgetType(DocumentFieldWidgetType.Text)
										   .setDisplayLogic(getSysConfigDisplayValue(I_C_Location.COLUMNNAME_DHL_PostId))
										   .setDataBinding(new AddressFieldBinding(IAddressModel.COLUMNNAME_DHL_PostId, false, I_C_Location::getDHL_PostId, AddressFieldBinding::writeValue_DHL_PostId)));

		//
		// Address1 ... Address4 fields
		addressDescriptor.addField(buildFieldDescriptor(IAddressModel.COLUMNNAME_Address1)
										   .setValueClass(String.class)
										   .setWidgetType(DocumentFieldWidgetType.Text)
										   .setDataBinding(new AddressFieldBinding(IAddressModel.COLUMNNAME_Address1, false, I_C_Location::getAddress1, AddressFieldBinding::writeValue_Address1)));
		//
		addressDescriptor.addField(buildFieldDescriptor(IAddressModel.COLUMNNAME_Address2)
										   .setValueClass(String.class)
										   .setWidgetType(DocumentFieldWidgetType.Text)
										   .setDataBinding(new AddressFieldBinding(IAddressModel.COLUMNNAME_Address2, false, I_C_Location::getAddress2, AddressFieldBinding::writeValue_Address2)));

		if(isShowAddress3())
		{
			addressDescriptor.addField(buildFieldDescriptor(IAddressModel.COLUMNNAME_Address3)
					.setValueClass(String.class)
					.setWidgetType(DocumentFieldWidgetType.Text)
					.setDataBinding(new AddressFieldBinding(IAddressModel.COLUMNNAME_Address3, false, I_C_Location::getAddress3, AddressFieldBinding::writeValue_Address3)));
		}

		if(isShowAddress4())
		{
			addressDescriptor.addField(buildFieldDescriptor(IAddressModel.COLUMNNAME_Address4)
					.setValueClass(String.class)
					.setWidgetType(DocumentFieldWidgetType.Text)
					.setDataBinding(new AddressFieldBinding(IAddressModel.COLUMNNAME_Address4, false, I_C_Location::getAddress4, AddressFieldBinding::writeValue_Address4)));
		}

		final boolean allowPOBoxAddress = isAllowPOBoxAddress();
		if (allowPOBoxAddress)
		{
			addressDescriptor.addField(buildFieldDescriptor(IAddressModel.COLUMNNAME_IsPOBoxNum)
											   .setValueClass(Boolean.class)
											   .setWidgetType(DocumentFieldWidgetType.YesNo)
											   .setDataBinding(new AddressFieldBinding(IAddressModel.COLUMNNAME_IsPOBoxNum, false, I_C_Location::isPOBoxNum, AddressFieldBinding::writeValue_IsPOBoxNum)));

			addressDescriptor.addField(buildFieldDescriptor(IAddressModel.COLUMNNAME_POBox)
											   .setValueClass(String.class)
											   .setDisplayLogic("@" + IAddressModel.COLUMNNAME_IsPOBoxNum + "/N@=Y")
											   .setWidgetType(DocumentFieldWidgetType.Text)
											   .setDataBinding(new AddressFieldBinding(IAddressModel.COLUMNNAME_POBox, false, I_C_Location::getPOBox, AddressFieldBinding::writeValue_POBox)));
		}

		// Postal, City, Region and Country fields
		final boolean usePostalLookup = isUsePostalLookup();
		if (usePostalLookup)
		{
			final AddressPostalLookupDescriptor postalLookup = AddressPostalLookupDescriptor.builder()
					.countryLookup(AddressCountryLookupDescriptor.newInstance())
					.build();
			addressDescriptor.addField(buildFieldDescriptor(IAddressModel.COLUMNNAME_C_Postal_ID)
											   .setValueClass(IntegerLookupValue.class)
											   .setWidgetType(DocumentFieldWidgetType.Lookup)
											   .setLookupDescriptorProvider(postalLookup)
											   .setDataBinding(new AddressFieldBinding(IAddressModel.COLUMNNAME_C_Postal_ID, false, postalLookup::getLookupValueFromLocation, AddressFieldBinding::writeValue_C_Postal_ID)));

		}
		else
		{
			//
			addressDescriptor.addField(buildFieldDescriptor(IAddressModel.COLUMNNAME_Postal)
											   .setValueClass(String.class)
											   .setWidgetType(DocumentFieldWidgetType.Text)
											   .setMandatoryLogic(getMandatoryLogic(I_C_Location.COLUMNNAME_Postal))
											   .setDataBinding(new AddressFieldBinding(IAddressModel.COLUMNNAME_Postal, false, I_C_Location::getPostal, AddressFieldBinding::writeValue_Postal)));
			//
			addressDescriptor.addField(buildFieldDescriptor(IAddressModel.COLUMNNAME_City)
											   .setValueClass(String.class)
											   .setWidgetType(DocumentFieldWidgetType.Text)
											   .setMandatoryLogic(getMandatoryLogic(I_C_Location.COLUMNNAME_City))
											   .setDataBinding(new AddressFieldBinding(IAddressModel.COLUMNNAME_City, false, I_C_Location::getCity, AddressFieldBinding::writeValue_City)));

			//
			// Region and Country fields
			addressDescriptor.addField(buildFieldDescriptor(IAddressModel.COLUMNNAME_C_Region_ID)
											   .setValueClass(IntegerLookupValue.class)
											   .setWidgetType(DocumentFieldWidgetType.Lookup)
											   .setDisplayLogic("@" + IAddressModel.COLUMNNAME_HasRegion + "/N@=Y")
											   .setLookupDescriptorProvider(AddressRegionLookupDescriptor.newInstance())
											   .setDataBinding(new AddressFieldBinding(IAddressModel.COLUMNNAME_C_Region_ID, false, AddressFieldBinding::readValue_C_Region_ID, AddressFieldBinding::writeValue_C_Region_ID)));
			//
			addressDescriptor.addField(buildFieldDescriptor(IAddressModel.COLUMNNAME_HasRegion)
											   .setWidgetType(DocumentFieldWidgetType.YesNo)
											   .removeCharacteristic(Characteristic.PublicField) // internal field (not displayed!)
											   .setDataBinding(AddressFieldBinding.internalField(IAddressModel.COLUMNNAME_HasRegion)));
			//
			final String defaultValueString = sysConfigBL.getValue(SYSCONFIG_PREFIX + "C_Country.DefaultLogic", "", Env.getAD_Client_ID());
			final Optional<IExpression<?>> countryDefaultExpression;
			if (Check.isNotBlank(defaultValueString))
			{
				countryDefaultExpression = DefaultValueExpressionsFactory.newInstance()
						.extractDefaultValueExpression(defaultValueString,
													   IAddressModel.COLUMNNAME_C_Country_ID,
													   DocumentFieldWidgetType.Lookup,
													   IntegerLookupValue.class,
													   true /*mandatory*/,
													   false /*allowUsingAutoSequence*/);
			}
			else
			{
				countryDefaultExpression = Optional.empty();
			}

			addressDescriptor.addField(buildFieldDescriptor(IAddressModel.COLUMNNAME_C_Country_ID)
											   .setValueClass(IntegerLookupValue.class)
											   .setWidgetType(DocumentFieldWidgetType.Lookup)
											   .setMandatoryLogic(true)
											   .setLookupDescriptorProvider(AddressCountryLookupDescriptor.newInstance())
											   .setDataBinding(new AddressFieldBinding(IAddressModel.COLUMNNAME_C_Country_ID, false, AddressFieldBinding::readValue_C_Country_ID, AddressFieldBinding::writeValue_C_Country_ID))
											   .setDefaultValueExpression(countryDefaultExpression)
											   .addCallout(AddressCallout::onC_Country_ID));
		}

		//
		// Build it and return
		return addressDescriptor.build();
	}



private boolean getSysConfigDisplayValue(final String columnname)
	{
		final String sysConfigName = SYSCONFIG_PREFIX
				+ columnname
				+ SYSCONFIG_SUFIX;

		return sysConfigBL.getBooleanValue(sysConfigName, false, Env.getAD_Client_ID());
	}

	private boolean getMandatoryLogic(final String columnName)
	{
		final POInfo poInfo = POInfo.getPOInfo(I_C_Location.Table_Name);
		return poInfo.isColumnMandatory(columnName);
	}

	private DocumentFieldDescriptor.Builder buildFieldDescriptor(@NonNull final String columnName)
	{
		return DocumentFieldDescriptor.builder(columnName)
				.setCaption(Services.get(IMsgBL.class).translatable(columnName))
				//
				// .setValueClass()
				// .setWidgetType()
				.setLookupDescriptorProvider_None()
				//
				.setReadonlyLogic(false)
				.setDisplayLogic(true)
				.setMandatoryLogic(false)
				//
				.addCharacteristic(Characteristic.PublicField)
				//
				// .setDataBinding(new AddressFieldBinding(columnName, false, I_C_Location::get))
				//
				;

	}

	private static AddressLayout createLayout(final DocumentEntityDescriptor addressDescriptor)
	{
		final AddressLayout.Builder layout = AddressLayout.builder();

		addressDescriptor.getFields()
				.stream()
				.filter(fieldDescriptor -> fieldDescriptor.hasCharacteristic(Characteristic.PublicField))
				.map(AddressDescriptorFactory::createLayoutElement)
				.forEach(layout::addElement);

		return layout.build();
	}

	private static DocumentLayoutElementDescriptor.Builder createLayoutElement(final DocumentFieldDescriptor fieldDescriptor)
	{
		return DocumentLayoutElementDescriptor.builder()
				.setCaption(fieldDescriptor.getCaption())
				.setWidgetType(fieldDescriptor.getWidgetType())
				.addField(DocumentLayoutElementFieldDescriptor.builder(fieldDescriptor.getFieldName())
								  .setLookupInfos(fieldDescriptor.getLookupDescriptor().orElse(null))
								  .setPublicField(true)
								  .setSupportZoomInto(fieldDescriptor.isSupportZoomInto()));
	}

	private static class AddressDataBindingDescriptorBuilder implements DocumentEntityDataBindingDescriptorBuilder
	{
		private final DocumentEntityDataBindingDescriptor dataBinding = new DocumentEntityDataBindingDescriptor()
		{
			@Override
			public DocumentsRepository getDocumentsRepository()
			{
				throw new IllegalStateException("No repository available for " + this);
			}
		};

		private AddressDataBindingDescriptorBuilder()
		{
		}

		@Override
		public DocumentEntityDataBindingDescriptor getOrBuild()
		{
			return dataBinding;
		}
	}

	private static final class AddressCallout
	{
		private static void onC_Country_ID(final ICalloutField calloutField)
		{
			final IAddressModel location = calloutField.getModel(IAddressModel.class);
			final I_C_Country country = location.getC_Country();
			final boolean hasRegions = country != null && country.isHasRegion();
			location.setHasRegion(hasRegions);
		}

	}

	public static final class AddressFieldBinding implements DocumentFieldDataBindingDescriptor
	{
		public static AddressFieldBinding internalField(final String columnName)
		{
			final boolean mandatory = false;
			final Function<I_C_Location, Object> readMethod = (location) -> null;
			final BiConsumer<I_C_Location, IDocumentFieldView> writeMethod = (toLocationRecord, fromField) -> {
			};
			return new AddressFieldBinding(columnName, mandatory, readMethod, writeMethod);
		}

		private final String columnName;
		private final boolean mandatory;
		private final Function<I_C_Location, Object> readMethod;
		private final BiConsumer<I_C_Location, IDocumentFieldView> writeMethod;

		private AddressFieldBinding(
				final String columnName //
				, final boolean mandatory //
				, final Function<I_C_Location, Object> readMethod //
				, final BiConsumer<I_C_Location, IDocumentFieldView> writeMethod //
		)
		{
			super();
			this.columnName = columnName;
			this.mandatory = mandatory;
			this.readMethod = readMethod;
			this.writeMethod = writeMethod;
		}

		@Override
		public String getColumnName()
		{
			return columnName;
		}

		@Override
		public boolean isMandatory()
		{
			return mandatory;
		}

		public Object readValue(final I_C_Location locationRecord)
		{
			return readMethod.apply(locationRecord);
		}

		@Nullable
		private static Object readValue_C_Region_ID(final I_C_Location locationRecord)
		{
			final I_C_Region region = locationRecord.getC_Region();
			if (region != null && region.getC_Region_ID() > 0)
			{
				final I_C_Region regionTrl = InterfaceWrapperHelper.translate(region, I_C_Region.class);
				return IntegerLookupValue.of(regionTrl.getC_Region_ID(), regionTrl.getName());
			}

			final String regionName = locationRecord.getRegionName();
			if (!Check.isBlank(regionName))
			{
				return IntegerLookupValue.of(-1, regionName);
			}

			return null;
		}

		@Nullable
		private static Object readValue_C_Country_ID(final I_C_Location locationRecord)
		{
			final CountryId countryId = CountryId.ofRepoIdOrNull(locationRecord.getC_Country_ID());
			if (countryId != null)
			{
				final ITranslatableString displayName = Services.get(ICountryDAO.class).getCountryNameById(countryId);
				final ITranslatableString helpText = null;
				return IntegerLookupValue.of(countryId, displayName, helpText);
			}
			else
			{
				return null;
			}
		}

		public void writeValue(final I_C_Location toLocationRecord, final IDocumentFieldView fromField)
		{
			writeMethod.accept(toLocationRecord, fromField);
		}

		public static void writeValue_Address1(final I_C_Location toLocationRecord, final IDocumentFieldView fromField)
		{
			toLocationRecord.setAddress1(fromField.getValueAs(String.class));
		}

		public static void writeValue_Address2(final I_C_Location toLocationRecord, final IDocumentFieldView fromField)
		{
			toLocationRecord.setAddress2(fromField.getValueAs(String.class));
		}

		public static void writeValue_Address3(final I_C_Location toLocationRecord, final IDocumentFieldView fromField)
		{
			toLocationRecord.setAddress3(fromField.getValueAs(String.class));
		}

		public static void writeValue_Address4(final I_C_Location toLocationRecord, final IDocumentFieldView fromField)
		{
			toLocationRecord.setAddress4(fromField.getValueAs(String.class));
		}

		public static void writeValue_Postal(final I_C_Location toLocationRecord, final IDocumentFieldView fromField)
		{
			toLocationRecord.setPostal(fromField.getValueAs(String.class));
		}

		public static void writeValue_City(final I_C_Location toLocationRecord, final IDocumentFieldView fromField)
		{
			toLocationRecord.setCity(fromField.getValueAs(String.class));
		}

		public static void writeValue_Street(final I_C_Location toLocationRecord, final IDocumentFieldView fromField)
		{
			toLocationRecord.setStreet(fromField.getValueAs(String.class));
		}

		public static void writeValue_HouseNumber(final I_C_Location toLocationRecord, final IDocumentFieldView fromField)
		{
			toLocationRecord.setHouseNumber(fromField.getValueAs(String.class));
		}

		public static void writeValue_DHL_PostId(final I_C_Location toLocationRecord, final IDocumentFieldView fromField)
		{
			toLocationRecord.setDHL_PostId(fromField.getValueAs(String.class));
		}

		public static void writeValue_IsPOBoxNum(final I_C_Location toLocationRecord, final IDocumentFieldView fromField)
		{
			toLocationRecord.setIsPOBoxNum(fromField.getValueAsBoolean());
		}

		public static void writeValue_POBox(final I_C_Location toLocationRecord, final IDocumentFieldView fromField)
		{
			toLocationRecord.setPOBox(fromField.getValueAs(String.class));
		}

		public static void writeValue_C_City_ID(final I_C_Location toLocationRecord, final IDocumentFieldView fromField)
		{
			final IntegerLookupValue city = fromField.getValueAs(IntegerLookupValue.class);
			if (city == null)
			{
				toLocationRecord.setC_City_ID(-1);
			}
			else if (city.getIdAsInt() <= 0)
			{
				toLocationRecord.setC_City_ID(-1);
				toLocationRecord.setCity(city.getDisplayName());
			}
			else
			{
				toLocationRecord.setC_City_ID(city.getIdAsInt());
				toLocationRecord.setCity(city.getDisplayName());
			}
		}

		public static void writeValue_C_Region_ID(final I_C_Location toLocationRecord, final IDocumentFieldView fromField)
		{
			final IntegerLookupValue region = fromField.getValueAs(IntegerLookupValue.class);
			if (region == null)
			{
				toLocationRecord.setC_Region_ID(-1);
			}
			else if (region.getIdAsInt() <= 0)
			{
				toLocationRecord.setC_Region_ID(-1);
				toLocationRecord.setRegionName(region.getDisplayName());
			}
			else
			{
				toLocationRecord.setC_Region_ID(region.getIdAsInt());
				toLocationRecord.setRegionName(region.getDisplayName());
			}
		}

		public static void writeValue_C_Country_ID(final I_C_Location toLocationRecord, final IDocumentFieldView fromField)
		{
			final IntegerLookupValue country = fromField.getValueAs(IntegerLookupValue.class);
			if (country == null)
			{
				toLocationRecord.setC_Country_ID(-1);
			}
			else if (country.getIdAsInt() <= 0)
			{
				toLocationRecord.setC_Country_ID(-1);
			}
			else
			{
				toLocationRecord.setC_Country_ID(country.getIdAsInt());
			}
		}

		private static void writeValue_C_Postal_ID(final I_C_Location toLocationRecord, final IDocumentFieldView fromField)
		{
			final IntegerLookupValue postalLookupValue = fromField.getValueAs(IntegerLookupValue.class);
			final int postalId = postalLookupValue != null ? postalLookupValue.getIdAsInt() : -1;
			if (postalId <= 0)
			{
				toLocationRecord.setC_Postal_ID(-1);
				toLocationRecord.setPostal(null);
				toLocationRecord.setCity(null);
				toLocationRecord.setC_City_ID(-1);
			}
			else
			{
				final I_C_Postal postalRecord = InterfaceWrapperHelper.load(postalId, I_C_Postal.class);
				toLocationRecord.setC_Postal_ID(postalRecord.getC_Postal_ID());
				toLocationRecord.setPostal(postalRecord.getPostal());
				toLocationRecord.setPostal_Add(postalRecord.getPostal_Add());
				toLocationRecord.setC_City_ID(postalRecord.getC_City_ID());
				toLocationRecord.setCity(postalRecord.getCity());

				toLocationRecord.setC_Country_ID(postalRecord.getC_Country_ID());

				toLocationRecord.setC_Region_ID(postalRecord.getC_Region_ID());
				toLocationRecord.setRegionName(postalRecord.getRegionName());
			}
		}

	}
}
