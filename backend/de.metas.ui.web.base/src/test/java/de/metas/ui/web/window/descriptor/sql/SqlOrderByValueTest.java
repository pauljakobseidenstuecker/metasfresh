package de.metas.ui.web.window.descriptor.sql;

import org.adempiere.ad.expression.api.IExpressionEvaluator;
import org.adempiere.ad.expression.api.IStringExpression;
import org.adempiere.ad.expression.api.impl.ConstantStringExpression;
import org.compiere.util.Evaluatees;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class SqlOrderByValueTest
{
	@Test
	void sqlSelectDisplayValue()
	{
		final SqlOrderByValue sqlOrderByValue = SqlOrderByValue.builder()
				.sqlSelectDisplayValue(SqlSelectDisplayValue.builder()
						.joinOnTableNameOrAlias("joinOnTableNameOrAlias")
						.joinOnColumnName("joinOnColumnName")
						.sqlExpression(SqlForFetchingLookupById.builder()
								.keyColumnNameFQ("keyColumnNameFQ")
								.numericKey(true)
								.displayColumn(ConstantStringExpression.of("displayColumn"))
								.descriptionColumn(ConstantStringExpression.of("descriptionColumn"))
								.activeColumn("IsActive")
								.validationMsgColumn(ConstantStringExpression.of("validationMsgColumn"))
								.sqlFrom(ConstantStringExpression.of("sqlFrom"))
								.additionalWhereClause("additionalWhereClause")
								.build())
						.columnNameAlias("columnName$Display")
						.build())
				.joinOnTableNameOrAlias("joinOnTableNameOrAlias2")
				.build();

		assertThat(sqlOrderByValue.isNull()).isFalse();
		assertThat(sqlOrderByValue.toSqlUsingColumnNameAlias())
				.isEqualTo("joinOnTableNameOrAlias2.columnName$Display[2]");
		assertThat(sqlOrderByValue.toSourceSqlExpression().evaluate(Evaluatees.empty(), IExpressionEvaluator.OnVariableNotFound.Fail))
				.isEqualTo("SELECT "
						+ "\n ARRAY[keyColumnNameFQ::text, displayColumn, descriptionColumn,IsActive, validationMsgColumn]"
						+ "\n FROM sqlFrom"
						+ "\n WHERE keyColumnNameFQ=joinOnTableNameOrAlias2.joinOnColumnName AND additionalWhereClause");
	}

	@Nested
	class sqlSelectValue
	{
		@Test
		void normalColumn()
		{
			final SqlOrderByValue sqlOrderByValue = SqlOrderByValue.builder()
					.sqlSelectValue(SqlSelectValue.builder()
							.tableNameOrAlias("tableNameOrAlias")
							.columnName("columnName")
							.virtualColumnSql(null)
							.columnNameAlias("columnNameAlias")
							.build())
					.joinOnTableNameOrAlias("joinOnTableNameOrAlias2")
					.build();

			assertThat(sqlOrderByValue.isNull()).isFalse();
			assertThat(sqlOrderByValue.toSqlUsingColumnNameAlias())
					.isEqualTo("joinOnTableNameOrAlias2.columnNameAlias");
			assertThat(sqlOrderByValue.toSourceSqlExpression().evaluate(Evaluatees.empty(), IExpressionEvaluator.OnVariableNotFound.Fail))
					.isEqualTo("joinOnTableNameOrAlias2.columnName");
		}

		@Test
		void virtualColumn()
		{
			final SqlOrderByValue sqlOrderByValue = SqlOrderByValue.builder()
					.sqlSelectValue(SqlSelectValue.builder()
							.virtualColumnSql("virtualColumnSql")
							.columnNameAlias("columnNameAlias")
							.build())
					.joinOnTableNameOrAlias("joinOnTableNameOrAlias2")
					.build();

			assertThat(sqlOrderByValue.isNull()).isFalse();
			assertThat(sqlOrderByValue.toSqlUsingColumnNameAlias())
					.isEqualTo("joinOnTableNameOrAlias2.columnNameAlias");
			assertThat(sqlOrderByValue.toSourceSqlExpression().evaluate(Evaluatees.empty(), IExpressionEvaluator.OnVariableNotFound.Fail))
					.isEqualTo("virtualColumnSql");
		}
	}

	@Test
	void columnName()
	{
		final SqlOrderByValue sqlOrderByValue = SqlOrderByValue.builder()
				.columnName("columnName")
				.joinOnTableNameOrAlias("joinOnTableNameOrAlias2")
				.build();

		assertThat(sqlOrderByValue.isNull()).isFalse();
		assertThat(sqlOrderByValue.toSqlUsingColumnNameAlias())
				.isEqualTo("joinOnTableNameOrAlias2.columnName");
		assertThat(sqlOrderByValue.toSourceSqlExpression().evaluate(Evaluatees.empty(), IExpressionEvaluator.OnVariableNotFound.Fail))
				.isEqualTo("joinOnTableNameOrAlias2.columnName");
	}

	@Test
	void allNulls()
	{
		final SqlOrderByValue sqlOrderByValue = SqlOrderByValue.builder()
				.joinOnTableNameOrAlias("joinOnTableNameOrAlias2")
				.build();

		assertThat(sqlOrderByValue.isNull()).isTrue();
		assertThat(sqlOrderByValue.toSqlUsingColumnNameAlias())
				.isNull();
		assertThat(sqlOrderByValue.toSourceSqlExpression())
				.isSameAs(IStringExpression.NULL);
	}

}